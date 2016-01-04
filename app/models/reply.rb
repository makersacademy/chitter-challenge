class Reply
  include DataMapper::Resource

  belongs_to :peep
  belongs_to :user

  property :id, Serial
  property :created_at, Time
  property :content, Text, required: true, length: 1..140
end
