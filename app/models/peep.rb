require 'data_mapper'
require_relative './datamapper_settings'

class Peep

  include DataMapper::Resource
  property :id, Serial
  property :body, Text , required: true
  
  data_mapper_settings
end
