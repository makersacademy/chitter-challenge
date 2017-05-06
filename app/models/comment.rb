class Comment
  include DataMapper::Resource

  property :id, Serial
  property :comment, Text
  property :created_at, DateTime

  validates_presence_of :comment, :message => "Please enter a comment"

  belongs_to :post
  belongs_to :user

end
