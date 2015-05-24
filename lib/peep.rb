class Peep

  include DataMapper::Resource

  property :id, Serial

  property :message, Text
  # property :timestamp, Time

end