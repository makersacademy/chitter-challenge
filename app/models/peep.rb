require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-core'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  belongs_to :user

  has n, :tags, through: Resource, constraint: :destroy
  # has n, :replies, through: Resource, constraint: :destroy

  property :id, Serial
  property :content, Text
  property :created_at, DateTime
end
