class Message
  include DataMapper::Resource

  property :id, Serial
  property :message, Text

  belongs_to :user

end
