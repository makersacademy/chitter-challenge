class Hashtag

  include DataMapper::Resource

  has n, :posts, through: Resource
  property :id, Serial
  property :text, String

end