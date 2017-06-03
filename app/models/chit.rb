class Chit

  include DataMapper::Resource

  property :id, Serial
  property :message, Text

end
