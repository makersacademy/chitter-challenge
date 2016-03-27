class Comment
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, required: true, length: 1..140
  property :time, DateTime, required: true

  belongs_to :user
  belongs_to :peep
end
