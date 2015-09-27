class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :message, Text, length: 250

end