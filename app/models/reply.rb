class Reply
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :reply, Text
  property :created_at, DateTime

  belongs_to :peep
  belongs_to :user
end
