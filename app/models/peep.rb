require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  has n, :user, through: Resource
  has n, :peep, through: Resource

  property :id, Serial
  property :message, Text
  property :time, Time

end
