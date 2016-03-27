class Comment
  include DataMapper::Resource

  property :id, Serial
  property :comment, Text, length: 1..50, required: true
  property :timestamp, Text, required: true

  belongs_to :user
  belongs_to :post
end
