class Post
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, length: 1..50, required: true
  property :timestamp, Text, required: true

  belongs_to :user
  has n, :comments
end
