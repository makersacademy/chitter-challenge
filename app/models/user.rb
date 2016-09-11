require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :handle, String, unique: true
  property :email, String, unique: true
  property :password, BCryptHash

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password, required: true

  def self.authenticate(email, password)
    user = first(email: email)
    db_pw = Password.new(user.password)
    user if user && db_pw == password
  end

end
