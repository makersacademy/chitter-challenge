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

end
