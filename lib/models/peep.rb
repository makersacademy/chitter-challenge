require 'data_mapper'

class Peep

  include DataMapper::Resource
  property :id, Serial
  property :body, Text

  has 1, :user, through: Resource

end
