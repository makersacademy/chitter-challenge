class Tweet

  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :time, DateTime
  property :user, String

  has n, :tags, through: Resource
  has 1, :user, through: Resource
end
