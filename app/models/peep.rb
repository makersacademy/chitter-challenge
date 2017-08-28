require 'data_mapper'
require 'dm-postgres-adapter'

# this class defines our peep table
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :time, DateTime
end
