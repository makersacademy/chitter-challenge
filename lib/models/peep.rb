class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

  has n,  :users, :through => Resource

end