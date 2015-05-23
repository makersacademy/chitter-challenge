
class Message

  include DataMapper::Resource
  property :id,         Serial
  property :message,    String,   length: 140

  belongs_to :user

end
