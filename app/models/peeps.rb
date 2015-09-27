class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :posted, String

  has 1, :user, through: Resource
  has n, :tags, through: Resource
end
