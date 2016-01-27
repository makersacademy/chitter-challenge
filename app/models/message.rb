class Message
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :sender_name, String
  property :sender_username, String
  property :time_stamp, String

end
