require './app/data_mapper_setup'
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :content, Text

end
