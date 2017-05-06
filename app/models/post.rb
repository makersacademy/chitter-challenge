class Post
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

  validates_presence_of :message, :message => "Please enter a message"

  belongs_to :user
  has n, :comments

end
