require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, Text
  property :username, String
  property :name, String

end
