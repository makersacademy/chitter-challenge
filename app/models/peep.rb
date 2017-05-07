class Peep
  include DataMapper::Resource

  has n, :users, through: Resource

  property :id, Serial
  property :peep, Text
  property :date, String
  property :time, String
end
