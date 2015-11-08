class Message
  include DataMapper::Resource

  property :id, Serial
  property :time, String
  property :user, String
  property :message, Text

end
