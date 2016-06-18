require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,            Serial
  property :handle,        String
  property :peep_content,  String

end
