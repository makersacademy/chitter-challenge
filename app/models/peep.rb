require './app/data_mapper_setup.rb'

class Peep
  include DataMapper::Resource


  property :id, Serial
  property :name, String
  property :message, String


end
