require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id,         Serial
  property :message,    String
  property :added_at,   DateTime
end
