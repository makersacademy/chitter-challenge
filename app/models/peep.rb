require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,         Serial # Serial means that it will be auto-incremented for every record
  property :peep,       Text
  property :timestamp,  DateTime 

end
