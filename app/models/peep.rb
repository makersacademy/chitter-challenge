class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :timestamp, Time

  belongs_to :user
end
