class Message
  include DataMapper::Resource

  property :id, 	Serial
  property :content, 	String, length: 140, required: true
  property :timestamp,	DateTime

  belongs_to :user, required: true
end
