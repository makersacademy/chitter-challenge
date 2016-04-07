class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, Text, required: true
  property :body, Text, required: true
  property :time, String

  belongs_to :user, :required => false

end