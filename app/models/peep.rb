require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  has n, :comments, through: Resource

  property  :id,          Serial
  property  :name,        String,   required: true
  property  :message,     String
  property  :created_at,  DateTime

end
