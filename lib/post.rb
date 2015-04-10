class Post
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :message, String
end