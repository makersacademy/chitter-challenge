require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, String

  # has  n, :users, :through => Resource

end
