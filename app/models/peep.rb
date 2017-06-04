
class Peep
  include DataMapper::Resource

  has n, :hashtags, through: Resource

  property :id, Serial
  property :time, DateTime
  property :charcount, Integer
  property :body, Text
  property :user_id, Integer
  property :likes, Integer

  validates_length_of :body, :max => 140
end
