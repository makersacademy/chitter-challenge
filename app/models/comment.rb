class Comment
  include DataMapper::Resource

  belongs_to :peep
  belongs_to :user

  property :id, Serial
  property :text, Text
  property :created_at, DateTime
end
