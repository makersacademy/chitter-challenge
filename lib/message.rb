require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id,         Serial
  property :userid,     Integer
  property :body,       String
  property :time,       DateTime
end
