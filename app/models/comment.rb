require_relative './user'
require_relative './peep'
require 'dm-timestamps'

class Comment
  include DataMapper::Resource
  property :id, Serial
  property :comment, Text, length: 1..141
  belongs_to :peep
  belongs_to :user
  property :created_at, DateTime
end
