class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :created_at, DateTime

end
