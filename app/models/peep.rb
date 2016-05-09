require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, length: 0..140
  property :posted, DateTime

  belongs_to :user
end
