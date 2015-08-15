class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :user_id, Integer
  property :creation_time, DateTime
end