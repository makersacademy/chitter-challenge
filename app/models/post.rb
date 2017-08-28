
class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, String
  property :time, String
  property :author, String
end
