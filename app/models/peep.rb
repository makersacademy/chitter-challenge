class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  Text
  property :username, String
  property :time,     String
end
