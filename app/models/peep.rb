require './data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,          Serial
  property :message,     String
  property :name,        String
  property :username,    String
  property :timestamp,   DateTime

end