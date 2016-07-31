require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Message
  include DataMapper::Resource

  property :id,         Serial
  property :message,    String, length: 140, required: true
  property :created_on, DateTime

  belongs_to :user
end
