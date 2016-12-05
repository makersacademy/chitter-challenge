require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/user'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text

end
