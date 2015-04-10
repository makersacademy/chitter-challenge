require 'data_mapper'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :name, String
  property :password, Text
  property :username, String

end