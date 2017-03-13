class Reply
  include DataMapper::Resource
  property :id, Serial
  property :reply_body, Text
  property :created_at, DateTime
  property :peep_id, Integer
  property :user_id, Integer
end
