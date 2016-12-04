require 'data_mapper'
require_relative './datamapper_settings'

class Peep

  include DataMapper::Resource
  property :id, Serial
  property :body, Text , required: true
  property :created_at, DateTime
  property :username, String
  property :name, String

  data_mapper_settings
end
