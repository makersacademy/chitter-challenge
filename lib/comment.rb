require 'data_mapper'

class Comment
  include DataMapper::Resource
  
  property :id, Serial
  property :content, Text
  property :created_at, DateTime


  belongs_to :message
  belongs_to :user

end