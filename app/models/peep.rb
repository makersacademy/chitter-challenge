require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  #has n, :tags, through: Resource

  property :id, Serial
  property :peep, Text, :lazy => false
  property :created_at, DateTime


end
