class Peep

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :message, Text, :required => true, :message => "You must enter a message"
  property :time, Time

end
