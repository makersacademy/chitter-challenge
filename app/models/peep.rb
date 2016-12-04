require './app/data_mapper_setup'
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  has n, :users, through: Resource

  property :id, Serial
  property :peep, String
  property :created_at, DateTime
  property :name, String

end

setup
