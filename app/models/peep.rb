require_relative '../data_mapper_setup'
require 'dm-validations'
require_relative 'user'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :time_created, Time
  has 1, :user, through: Resource
end
