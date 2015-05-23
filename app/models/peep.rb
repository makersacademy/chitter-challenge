class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  # property :name, String
  # property :username, String

end