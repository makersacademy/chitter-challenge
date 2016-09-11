require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require_relative '../data_mapper_setup'

class Peep
  include DataMapper::Resource

property :id,     Serial
property :peep,   Text
property :time,   Time

end
