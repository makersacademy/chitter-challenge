require 'data_mapper'
require './app/data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :body, String
  property :name, String
  property :username, String
  property :time, DateTime

  has n, :user, through: Resource

end


