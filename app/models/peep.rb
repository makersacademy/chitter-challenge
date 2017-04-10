require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Peep
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :content, String

end
