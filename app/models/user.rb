require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true, format: :email_address, unique: true
  property :password, BCryptHash
  property :username, String, required: true, unique: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def self.authenticate(email, password)
    first(email: email)
  end

  # def self.authenticate(email, password)
  #   user = first(email: email)
  #   if user && BCrypt::Password.new(user.password) == password
  #     user
  #   else
  #     nil
  #   end
  # end

end
