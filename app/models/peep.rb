require_relative '../data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :name, Text
  property :username, Text
  
end