class Peep

  include DataMapper::Resource
  has n, :user, through: Resource

  property :id, Serial

  property :message, Text
  # property :timestamp, Time

end