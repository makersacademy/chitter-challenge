class Peep

  include DataMapper::Resource

  has n, :makers, :through => Resource

  property :id, Serial
  property :peep, String

end
