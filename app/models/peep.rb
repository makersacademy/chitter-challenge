require 'data_mapper'
require 'dm-postgres-adapter'
# require './app/data_mapper_setup'
# require_relative 'user'

class Peep

  include DataMapper::Resource


  property :id, Serial
  property :content, String
  property :time, DateTime
  
  belongs_to :user

end
