class Message
  include DataMapper::Resource

  property :id,    Serial
  property :context, Text

end
