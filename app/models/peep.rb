class Peep
  include DataMapper::Resource
  
  has n, :tags, through: Resource

  property :id, Serial
  property :message, String
  property :created_at, Time
end
