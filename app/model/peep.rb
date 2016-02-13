# require_relative '../data_mapper_setup.rb'

class Peep
  include DataMapper::Resource

  # has n, :tag, through: Resource

  property :id,   Serial
  property :peep, String
  # property :url, String

end
