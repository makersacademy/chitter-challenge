require 'data_mapper'
require 'dm-postgres-adapter'

class Cheet
  include DataMapper::Resource

  property :id, Serial
  property :write, Text
  property :time, DateTime

end
