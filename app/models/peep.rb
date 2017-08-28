require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :message, String
  property :created_at, DateTime
  # has n, :tags
  property :tag, String
  belongs_to :user, :required => false
end
