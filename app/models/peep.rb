require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class Peep

  include DataMapper::Resource

  property :id,      Serial
  property :content, Text

end
