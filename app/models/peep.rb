require 'data_mapper'
require 'dm-postgres-adapter'
# Peep class
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, Text
end
