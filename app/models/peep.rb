require 'data_mapper'
require './app/data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,           Serial
  property :content,      Text
  property :time,         DateTime
  property :name,         String
  property :username,     String

  has 1, :user, through: Resource

end
