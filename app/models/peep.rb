class Peep
  include DataMapper::Resource

  property :id, Serial
  property :pweep, String
  property :time, String

end

