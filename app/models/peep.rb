require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :handle,     String
  property :post,       String
  property :created_at, DateTime
end
