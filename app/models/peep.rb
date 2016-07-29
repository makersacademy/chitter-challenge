class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :comment,      String
  property :created_at,   DateTime 


end
