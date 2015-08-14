class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, String
  property :user_id, Integer

end