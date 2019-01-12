require 'data_mapper'

class Comment
  include DataMapper::Resource
  
  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  has n, :commentMessages
  has n, :messages, :through => :commentMessages

end