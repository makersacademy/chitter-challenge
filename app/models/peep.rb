class Peep
  include DataMapper::Resource

  belongs_to :user
  has n, :replies

  property :id, Serial
  property :created_at, Time 
  property :content, Text, required: true, length: 1..140
end
