require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :username,    String
  property :content,      Text
  property :time,      DateTime

end
