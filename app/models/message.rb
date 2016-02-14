require 'data_mapper'

class Message
  include DataMapper::Resource
  
  property :id, Serial
  property :body, Text
  property :date, DateTime
  
  belongs_to :user
  belongs_to :messagestream
end