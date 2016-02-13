require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String, unique: true
  property :real_name,  String
  property :email,      String, format: :email_address,
                                unique: true
  property :password,   String

  attr_accessor :password_confirmation


end
