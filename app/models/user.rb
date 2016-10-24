require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id,         Serial
  property :email,      String
  property :name,       String
  property :username,   String
  property :password,   BCryptHash

end
