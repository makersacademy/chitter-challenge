require 'data_mapper'
require './app/data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :peep,     String
  property :time,     DateTime
  property :username, String

  has 1, :user, through: Resource

end
