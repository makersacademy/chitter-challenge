class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :message,  String
  property :posted,   String

  has n, :users, through: Resource
  has n, :tags, through: Resource
end
