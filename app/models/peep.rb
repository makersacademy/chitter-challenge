require "data_mapper"
require "dm-postgres-adapter"
require "dm-validations"
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id,              Serial
  property :peep,            String, required: true
  property :time_created,    DateTime, required: true

  validates_presence_of :peep
  validates_presence_of :time_created

  has 1, :user, through: Resource
end
