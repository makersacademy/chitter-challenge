require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :post, String, length: 1..225
  property :created_at, DateTime
  property :created_on, Date

  belongs_to :user

end
