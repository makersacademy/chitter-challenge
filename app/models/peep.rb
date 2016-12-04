require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './data_mapper_setup'
require 'dm-timestamps'
require_relative 'user'

class Peep

  include DataMapper::Resource

  has n, :users, through: Resource

  property :id, Serial
  property :peep, String
  property :created_at, DateTime
  property :name, String

end

setup
