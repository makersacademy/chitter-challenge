require 'data_mapper'
require './app/data_mapper_setup'

class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :content,     String
  property :time,     DateTime

  belongs_to :user

end
