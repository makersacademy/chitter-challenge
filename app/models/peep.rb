class Peep

  include DataMapper::Resource

  property :id,     Serial 
  property :peep,  String
  property :created_at, DateTime
 
end
