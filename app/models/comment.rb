require 'data_mapper'

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :comment, Text, required: true
  property :timestamp, Text, required: true

  belongs_to :user
  belongs_to :post
end
