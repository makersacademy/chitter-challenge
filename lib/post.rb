class Post
  include DataMapper::Resource
  has 1, :user, :through=>DataMapper::Resource

  property :id, Serial
  property :content, Text
  
end