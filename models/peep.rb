class Peep
  
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

end
