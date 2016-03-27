require 'data_mapper'
require 'dm-postgres-adapter'

class Like
  include DataMapper::Resource

  property :id,       Serial

  belongs_to :peep

end
