require 'dm-timestamps'
require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :text,      String
  property :timestamp, DateTime

end