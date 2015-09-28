class Peep

  include DataMapper::Resource

  property :id, Serial
  property :heading, String
  property :message, Text, length: 250
  property :created_at, DateTime

  belongs_to :user

end