class Comment
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, :required => true
  property :created_at, EpochTime
  property :peep_id, Integer
  property :user_id, Integer

  belongs_to :peep, :user
end
