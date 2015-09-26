class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :peep,   String

end
