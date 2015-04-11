class Post

  include DataMapper::Resource

  property :id, Serial
  property :peep, String
  property :user, String
  has n, :tags, through: Resource

end
