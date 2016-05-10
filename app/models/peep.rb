require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource 

  property :id, Serial 
  property :content, String
  property :username, String
  property :time, DateTime

end