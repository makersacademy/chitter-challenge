require 'bcrypt'

class User
  include DataMapper::Resource
  
  property :id, Serial
  property :email, Text
  property :username, Text
  property :encrypted_password, Text
end