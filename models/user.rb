require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, Text
  property :name, String
  property :username, String

end
