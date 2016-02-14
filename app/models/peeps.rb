class Peep

  include DataMapper::Resource

  has n, :users, through: Resource
  has n, :replies, through: Resource

  property :id, Serial
  property :peep, Text
  property :time, String



end
