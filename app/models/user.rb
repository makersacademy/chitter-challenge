require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, Text
  property :password, String
  # property :name, Text
  # property :surname, Text

end