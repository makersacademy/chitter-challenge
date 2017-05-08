require 'data_mapper'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, length: 140,  required: true
  property :timestamp, DateTime

  belongs_to :user, required: true

end
