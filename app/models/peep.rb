require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :message,  Text
  #will need property time created and user relationship

end
