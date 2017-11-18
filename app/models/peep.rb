class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, :required => true
  property :created_at, DateTime

  has 1, :user, through: Resource
  has n, :tags, through: Resource
end
