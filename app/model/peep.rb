require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       String
  property :created_at, DateTime

end
