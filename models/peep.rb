require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :post, Text
  property :created_at, Time

  belongs_to :user

end
