class Comment
  include DataMapper::Resource

  property :id,           Serial
  property :comment_text, Text
  property :created_at,   DateTime

  validates_presence_of :comment_text, :message => "Please enter a comment"

  belongs_to :post
  belongs_to :user
end
