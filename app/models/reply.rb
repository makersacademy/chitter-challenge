class Reply
  include DataMapper::Resource

  property :id, Serial
  property :message, String, length: 150, required: true
  property :datetime, DateTime

  belongs_to :user
  belongs_to :peep
end
