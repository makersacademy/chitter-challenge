require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource


  property :id, Serial
  property :text, String

  has 1, :users, :through => Resource

end
