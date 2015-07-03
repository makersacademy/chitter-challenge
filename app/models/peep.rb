class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :date, Time

end