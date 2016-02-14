

class Message

  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :username, String
  property :time, String

end
