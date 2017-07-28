require 'data_mapper'
require 'dm-postgres-adapter'

class Message

  include DataMapper::Resource

  property :id,   Serial
  property :body, Text
  property :posted_at, DateTime
  property :user_id, Integer

end
