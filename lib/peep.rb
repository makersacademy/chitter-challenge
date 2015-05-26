class Link

  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id,        Serial
  property :peep_msg,  Text
  property :peep_time, DateTime
  property :user_id,   Serial



end