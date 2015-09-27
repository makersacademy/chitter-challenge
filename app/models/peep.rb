require 'data_mapper'
require './app/data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,           Serial
  property :content,      Text
  property :time_created, DateTime

end
