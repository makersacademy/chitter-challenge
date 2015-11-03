require 'data_mapper'
require './app/data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,           Serial
  property :content,      Text
  property :time,         DateTime
  property :name,         String
  property :username,     String

  belongs_to :user
  has n, :replies

end
