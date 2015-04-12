class Peep

  include DataMapper::Resource

  property :id, Serial
  property :time, DateTime
  property :content, Text
  # property or has n, linked to a user
  # has n, :tags, through: Resource
end
