class Peep
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :content, Text, length: 1..140

  has n, :tags
  belongs_to :user, required: false
end
