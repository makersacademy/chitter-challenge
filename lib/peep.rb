class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :tag, String

end