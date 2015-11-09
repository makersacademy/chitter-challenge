class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :peep, String, :length => 0..20 

end
