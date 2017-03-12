require 'data_mapper'
require 'dm-postgres-adapter'

class Comment

  include DataMapper::Resource

  belongs_to :user
  belongs_to :peep

  property :id, Serial
  property :content, Text, length: 140, required: true
  property :timestamp, Time, required: true

end
