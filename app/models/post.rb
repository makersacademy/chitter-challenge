class Post
  include DataMapper::Resource

  property :id,      Serial
  property :text,    Text, :length => 140
  property :time,    String

  belongs_to :user
end
