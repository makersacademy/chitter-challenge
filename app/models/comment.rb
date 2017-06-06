
class Commment
  include DataMapper::Resource

  property :id, Serial
  property :peep_id, Integer
  property :user_id, Integer
  property :body, Text
  property :time, DateTime

end
