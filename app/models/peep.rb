require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text, required: true
  property :time_made, DateTime, required: true

  belongs_to :user, required: true

end