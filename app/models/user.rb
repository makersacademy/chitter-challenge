require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true, unique: true ,format: :email_address#, messages: {is_unique: "Email address already in use!"}
  property :password_hash, Text
  property :name, String
  property :username, String, required: true, unique: true

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

  def authenticate(password)
    Password.new(password_hash) == password
  end
end
