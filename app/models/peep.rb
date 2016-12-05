require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

  belongs_to :user

end
