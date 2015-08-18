class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :user_id, Integer

end