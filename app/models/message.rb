require 'data_mapper'
require 'dm-postgres-adapter'

class Message

  include DataMapper::Resource

  property :id, Serial
  property :content, String, required: true
  property :user, String
  property :time, Time

end
