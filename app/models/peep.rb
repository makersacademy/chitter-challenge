require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource
  has n, :user, through: Resource

  property :id,    Serial
  property :peep,  String

end
