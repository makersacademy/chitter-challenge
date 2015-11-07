require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime
  property :created_on, Date
  
  belongs_to :user
end
