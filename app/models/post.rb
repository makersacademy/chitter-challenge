class Post
  include DataMapper::Resource

  property :id,   Serial
  property :body, Text
  property :time, String
  property :username, String

end
