require './app/data_mapper_setup'
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text

  belongs_to :user
end
