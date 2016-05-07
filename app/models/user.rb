require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :username, String
  property :email, String
  property :password, String

end
