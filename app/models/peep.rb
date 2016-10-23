require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  has 1, :user, through: Resource
  has 1, :peep, through: Resource

  property :id, Serial
  property :message, Text
  property :time, Time

end
