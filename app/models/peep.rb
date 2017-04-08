require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

# This class corresponds to a table in the database
class Peep
  include DataMapper::Resource

  has n, :hashtags, through: Resource

  property :id, Serial
  property :message, String
  property :name, String
  property :username, String
  property :timeposted, String
end
