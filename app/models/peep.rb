require "data_mapper"
require "dm-postgres-adapter"
require "dm-validations"

class Peep
  include DataMapper::Resource

  property :id,              Serial
  property :peep,            String
end
