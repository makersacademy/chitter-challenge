require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Comment
  include DataMapper::Resource

  belongs_to :user
  belongs_to :peep

  property :id,         Serial
  property :comment,    Text, length: 1..240, required: true
  property :created_at, DateTime

end
