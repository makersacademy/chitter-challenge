require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation

  property :id,       Serial
  property :name,     String
  property :username, String
  property :email,    String
  property :password, BCryptHash

  validates_confirmation_of :password

end
