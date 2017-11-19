class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  Text, length: 1..200
  property :username, String
  property :time,     String

  belongs_to :user
end
