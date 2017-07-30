require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class User
  include DataMapper::Resource

  has n, :peeps

  property :id,   Serial
  property :name, String
  property :email, String
  property :password, Text
end
