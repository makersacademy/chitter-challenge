
class Like
  include DataMapper::Resource

  property :id, Serial
  property :peep_id, Integer
  property :user_id, Integer
end
