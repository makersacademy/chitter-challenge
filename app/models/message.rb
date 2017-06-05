class Message

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :time, DateTime

end
