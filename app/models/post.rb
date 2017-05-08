class Post
  include DataMapper::Resource

  property :id,     Serial
  property :timestamp, Time
  property :contents, Text

  belongs_to :user

end
