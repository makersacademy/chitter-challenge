class Tweet
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :message, String
end
