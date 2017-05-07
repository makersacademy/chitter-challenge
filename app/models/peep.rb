require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class Peep

  include DataMapper::Resource

  property :id,            Serial
  property :username,      String
  property :peep,          String, required: true

end
