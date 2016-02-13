require 'bcrypt'
require 'dm-validations'

class User
  include BCrypt
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :email,    String
  property :password, String
  property :password_confirmation, String

end
