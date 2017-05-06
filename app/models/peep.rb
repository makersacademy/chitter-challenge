require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class Peep

  include DataMapper::Resource
  attr_reader :username, :password

  property :id,            Serial
  property :username,      String, required: true, unique: true
  property :peep,          String, required: true

end
