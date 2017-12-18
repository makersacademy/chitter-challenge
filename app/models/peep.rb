require './app/data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :name, Text
  property :username, Text
  property :created_at, DateTime

end
