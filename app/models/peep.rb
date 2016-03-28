require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true
  property :peep, String, required: true
  property :time, String

end
