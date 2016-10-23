class Post
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, :length => 100, :required => true
  property :created_at, DateTime

  belongs_to :user
end
