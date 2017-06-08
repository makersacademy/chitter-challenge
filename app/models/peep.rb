
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :time, DateTime
  property :charcount, Integer
  property :body, Text
  property :user_id, Integer
  property :likes, Integer
  property :is_archived, Text, default: false

  has n, :hashtags, :through => Resource

  validates_length_of :body, :max => 140
end
