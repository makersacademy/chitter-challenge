
class Message
  include DataMapper::Resource

  property :id, Serial
  property :content, String, length: 200
  property :created_at, DateTime

  belongs_to :user

end