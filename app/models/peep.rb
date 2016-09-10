require "data_mapper"
require "dm-postgres-adapter"

class Peep

  include DataMapper::Resource

  has 1, :user, through: Resource

  property :id,       Serial
  property :content,  String
  property :time,     Time

end
