require 'bcrypt'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation

  property :id,        Serial
  property :username,  String, unique: true, required: true
  property :email,     String, unique: true, format: :email_address, required: true
  property :name,      String, required: true
  property :password,  BCryptHash, required: true

  validates_confirmation_of :password

end