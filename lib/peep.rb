class Peep

  include DataMapper::Resource
  # has n, :user, through: Resource
  belongs_to :user, :required => false

  property :id, Serial

  property :message, Text
  # property :timestamp, Time

end