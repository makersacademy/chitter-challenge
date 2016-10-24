require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Peep

  include DataMapper::Resource
  has 1, :user, :through => Resource

  property :id,         Serial
  property :content,    String
  property :created_at,  DateTime

end
   
