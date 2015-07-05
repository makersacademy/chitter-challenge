require 'data_mapper'
require 'dm-timestamps'

class Peep 
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :message, String 
  property :created_at, DateTime

end