class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, length: 120
  property :created_at, DateTime

  belongs_to :user

end
