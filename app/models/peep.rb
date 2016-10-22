require_relative '../data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,     Serial
  property :text,   Text

end
