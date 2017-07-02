require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String
  property :password, String


end
