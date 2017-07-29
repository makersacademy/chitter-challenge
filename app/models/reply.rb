class Reply
  include DataMapper::Resource

  belongs_to :peep
  belongs_to :user

  property :id, Serial
  property :content, Text, required: true
  property :created_at, DateTime, required: true
end
