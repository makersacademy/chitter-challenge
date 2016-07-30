class Peep

  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :message, Text
  property :full_name, String
  property :username, String

end
