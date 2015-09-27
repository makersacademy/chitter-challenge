class Post

  include DataMapper::Resource

  property :id, Serial
  property :message, Text, required: true

  belongs_to :user
end