require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,     Serial
  property :message,  String, required: true
  property :username,     String, required: true
  property :time,     String, required: true

end
