class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :username, String
  property :name, String
  property :created_at, DateTime

end
