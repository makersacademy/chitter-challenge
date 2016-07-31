require 'data_mapper'
require 'dm-postgres-adapter'

class Message
  include DataMapper::Resource

  property :id,        Serial
  property :message,   String, length: 140, required: true
  property :time,      Time

  belongs_to :user
end
