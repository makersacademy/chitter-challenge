require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :peep, String
  property :username, Text
  property :created_at, DateTime
end
