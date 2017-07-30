require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property    :id,          Serial
  property    :message,     String, :length => 1..160
  property    :created_at,  DateTime
end
