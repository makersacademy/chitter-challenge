require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text

  has 1, :user

end
