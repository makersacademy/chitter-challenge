class Post
  include DataMapper::Resource

  property :id, Serial

  # get rid of username
  property :username, String
  property :message, String
  property :time, DateTime
  has n, :hashtag, through: Resource
  # belongs_to :user
end