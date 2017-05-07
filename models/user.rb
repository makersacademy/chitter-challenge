require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, required: true
  property :email, String, format: :email_address, required: true, unique: true
  property :user_name, String, required: true, unique: true
  property :hash_password, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.hash_password = BCrypt::Password.create(password)
  end

  def self.authenticate(user_name, password)
    user = first(user_name: user_name)
    if user && BCrypt::Password.new(user.hash_password) == password
      user
    else
      nil
    end
  end

end
