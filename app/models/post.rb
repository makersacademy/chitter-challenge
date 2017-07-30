class Post
  include DataMapper::Resource

  property :id,      Serial
  property :text,    String
  property :time,    String

  has n, :user, through: Resource
end
