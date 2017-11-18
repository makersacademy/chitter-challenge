require_relative '../data_mapper_config'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :added, Time

end
