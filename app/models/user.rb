require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :username, String, required: true, unique: true,
    messages: { presence: "A username is required to sign up",
                is_unique: "Someone has already taken that username" }
  property :email, String, required: true, format: :email_address, unique: true,
    messages: { presence: "An email address is required to sign up",
                is_unique: "Someone has already taken that email address",
                format: "Please ensure you enter a valid email address" }
  property :encrypted_password, Text
  attr_accessor :password_confirmation

  validates_confirmation_of :password


  has n, :peeps
  
  def password
    @password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    self.encrypted_password = Password.create(new_password)
  end

end