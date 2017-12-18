require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
# Peep class
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, String
end
