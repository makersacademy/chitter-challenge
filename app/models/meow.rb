# This class will be responsible for the "meows" sent out.
require 'data_mapper'
require 'dm-postgres-adapter'

class Meow
  include DataMapper::Resource

  has 1, :user, through: Resource

  property :id,       Serial
  property :message,  String, length: 140
  property :time,     DateTime

end
