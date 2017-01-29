require 'date'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :words, String
  property :email, String
  property :time, Date
  has 1, :user, through: Resource
end
