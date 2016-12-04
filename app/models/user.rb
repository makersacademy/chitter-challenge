require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password, String, :length => 70

end
