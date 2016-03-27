require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  Text,   required: true
  property :time,     DateTime

  belongs_to :user

end
