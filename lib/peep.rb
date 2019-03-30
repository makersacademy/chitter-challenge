require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :content,    Text, :lazy => false
  property :created_at, DateTime
end
