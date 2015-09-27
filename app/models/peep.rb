class Peep

  include DataMapper::Resource

  property :peep_id,   Serial
  property :body,      String
  property :timestamp, DateTime
  property :peeper,    Text

  has n, :users, through: Resource

end