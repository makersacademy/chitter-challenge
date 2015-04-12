class Message

  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :author, String
  property :time_stamp, DateTime

end