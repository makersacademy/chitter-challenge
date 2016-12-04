require './app/data_mapper_setup'
require 'dm-validations'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :message, Text
end
