require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  has n, :hashtags, through: Resource

  property :id, Serial
  property :peep, Text
  property :created_at, DateTime

end
