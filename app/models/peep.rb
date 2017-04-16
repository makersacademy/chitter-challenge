require 'data_mapper'
require 'dm-postgres-adapter'
# require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :user, String
  property :peep, Text
  property :created_at, DateTime

end
