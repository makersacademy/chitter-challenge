require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :text,  Text, length: 255
  property :time,    DateTime

end
