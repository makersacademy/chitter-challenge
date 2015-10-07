class Reply
  include DataMapper::Resource

  property :id, Serial
  property :body, Text

  belongs_to :peep
  belongs_to :user
end
