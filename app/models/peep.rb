require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id , Serial
  property :time_created , DateTime
  property :message , Text , required: true

  has 1, :user, through: Resource

end
