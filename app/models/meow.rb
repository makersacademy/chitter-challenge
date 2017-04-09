# This class will be responsible for the "meows" sent out.
require 'data_mapper'
require 'dm-postgres-adapter'

class Meow
  include DataMapper::Resource

  property :id,       Serial
  property :message,  String
  property :time,     DateTime

end
