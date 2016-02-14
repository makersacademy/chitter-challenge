require './app/datamapper_setup.rb'

class Peep
  include DataMapper::Resource

  has n, :user, through: Resource

  property :id,   Serial
  property :peep, String

end
