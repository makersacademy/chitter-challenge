require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Message

  include DataMapper::Resource

  property :id,         Serial
  property :body,       Text
  property :name,       String
  property :created_at, DateTime

end
