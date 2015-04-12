class Post
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :message, String

  has n, :hashtag, through: Resource
end