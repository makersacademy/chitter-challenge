require 'dm-timestamps'

class Message

  include DataMapper::Resource

  belongs_to :user

  property :id,         Serial
  property :message,    Text
  property :created_at, DateTime

end
