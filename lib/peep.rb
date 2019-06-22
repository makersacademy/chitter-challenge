require 'data_mapper'
require 'dm-core'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :user
end