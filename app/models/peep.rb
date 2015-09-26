class Peep

  include DataMapper::Resource

  

  property :id, Serial
  property :message, String, required: true
  property :created_at, DateTime

end
