require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

include DataMapper::Resource

property :id,         Serial
property :peep,       Text
property :created_at, DateTime

end
