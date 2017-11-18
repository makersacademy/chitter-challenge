require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :maker, String
  property :body, Text
  property :created_at, DateTime
end
