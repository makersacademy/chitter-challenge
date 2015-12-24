class Post
  include DataMapper::Resource

  has n, :users, through: Resource

  property :id,   Serial
  property :body, Text
  property :time, Serial
  
end
