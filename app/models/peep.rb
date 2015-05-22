class Peep

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :created_at, DateTime
end