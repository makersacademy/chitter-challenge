class Feed
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :peep, Text

  belongs_to :user
end
