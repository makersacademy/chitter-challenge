require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id,        Serial
  property :username,  String, unique: true
  property :email,     String, unique: true, format: :email_address
  property :password,  BCryptHash

  validates_confirmation_of :password

end