class Peep

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :message, Text
  property :time, Time

end
