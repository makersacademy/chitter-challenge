require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :comment, String

  has 1, :user, through: Resource

end
