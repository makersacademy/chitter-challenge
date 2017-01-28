require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  belongs_to :user
  # has n, :comments
  property :id, Serial
  property :content, Text, length: 140, required: true
  property :timestamp, Time, required: true

end
