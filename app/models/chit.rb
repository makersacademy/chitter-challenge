require 'data_mapper'
require 'dm-postgres-adapter'

class Chit
  include DataMapper::Resource

  # belongs to :users
  property :id,   Serial
  property :body, Text
end
