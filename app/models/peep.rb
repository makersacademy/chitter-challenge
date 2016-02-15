require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :message,  Text
  property :time, String
  property :dis_time, String
  #will need property time created and user relationship

end
