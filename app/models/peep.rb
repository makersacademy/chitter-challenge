require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :comment,    Text

  belongs_to :user

end
