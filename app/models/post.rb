class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, Text, required: true
  property :body, Text, required: true

end