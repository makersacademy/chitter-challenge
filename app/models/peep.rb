require_relative 'data_mapper_setup.rb'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :peep, String
  property :time, String

end
