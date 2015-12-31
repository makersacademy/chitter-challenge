class Comment
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :peep_id, Integer
  property :user_id, Integer

  belongs_to :peep, :user
end
