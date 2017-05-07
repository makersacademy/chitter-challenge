require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text, required: true
  property :timestamp, String

end
