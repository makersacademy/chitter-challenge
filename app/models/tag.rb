require 'data_mapper'
require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :name, String
end
