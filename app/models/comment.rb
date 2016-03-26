require 'data_mapper'

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :comment, Text
  property :timestamp, Text

  belongs_to :user
  belongs_to :post
end
