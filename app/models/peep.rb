require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class Peep
  include DataMapper::Resource

  has 1, :user, through: Resource
  has 1, :peep, through: Resource

  property :id,           Serial
  property :body,         String, length: 100
  property :time,         Time

end
