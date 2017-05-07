class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, String
  property :time, DateTime
  property :user_id, Integer

  belongs_to :user

end
