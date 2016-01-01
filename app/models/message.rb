class Message
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :sender, String

end
