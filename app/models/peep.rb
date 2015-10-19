require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :content, Text
  property :time, DateTime

  has n, :user, through: Resource
end
