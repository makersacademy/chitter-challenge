require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :content,    Text,   required: true
  property :created_at, DateTime

  belongs_to :user
end
