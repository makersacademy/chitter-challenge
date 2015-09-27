class Peep

  include DataMapper::Resource

  property :peep_id,   Serial
  property :body,      String
  property :timestamp, Text
  property :peeper,    Text

  has n, :users, through: Resource

end