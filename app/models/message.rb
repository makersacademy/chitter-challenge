require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :user_id, Integer
  property :message, Text
  property :time, DateTime

  belongs_to :user
end
