require './app/data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id,        Serial
  property :message,     Text
  #property :time,    DateTime

end
