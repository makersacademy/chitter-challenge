require 'dm-timestamps'

class Message
  include DataMapper::Resource
  property :id,             Serial
  property :message,        String,   length: 140
  property :created_at,     DateTime
  property :replies_to_id,  Integer
  belongs_to :user
end
