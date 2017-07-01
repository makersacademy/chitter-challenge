require 'data_mapper'

class Peep
  
  include DataMapper::Resource
  
  property :id,   Serial
  property :peep, Text
  
end
