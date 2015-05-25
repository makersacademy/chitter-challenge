class Message

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :peep, String

end