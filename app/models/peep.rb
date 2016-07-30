require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,    Serial
  property :peep,  String
  property :author, String

  has n, :user, through: Resource


end
