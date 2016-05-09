require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'


class Peeps

  include DataMapper::Resource

  property :id,       Serial
  property :peep,     String required: true
  property :time,     DateTime
  property :username, String, required: true



end



