class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :message,  String
  property :timestamp, Time

  belongs_to :user
end

