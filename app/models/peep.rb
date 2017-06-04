class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :posted_at, DateTime

end
