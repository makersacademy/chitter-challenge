require_relative 'datamapper'

class Message
  include DataMapper::Resource
  belongs_to :user
  property :id,           Serial
  property :text,         String
  property :created_at,   DateTime
  property :user_id,      Serial
end
