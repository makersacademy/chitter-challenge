class Peep
  include DataMapper::Resource

  has n, :makers, :through => Resource

end
