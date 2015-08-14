require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,        Serial
  property :text,      String
  property :timestamp, DateTime

end