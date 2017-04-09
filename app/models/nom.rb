require 'data_mapper'
require 'dm-postgres-adapter'
# require 'dm-migrations'

class Nom
  include DataMapper::Resource

  property :id, Serial
  property :nom, String
  property :posted, DateTime

end
