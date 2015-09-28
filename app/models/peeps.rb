class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :message,  Text
  property :posted,   String

  belongs_to :user
  has n, :tags, through: Resource
end
