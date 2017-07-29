require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  # belongs to :users
  property :id,   Serial
  property :body, Text
  property :created_at, DateTime
end
