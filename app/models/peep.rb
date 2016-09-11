class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text #introduce custom rchar limit?
  property :time, EpochTime 

end
