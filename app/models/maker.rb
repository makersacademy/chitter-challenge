class Maker
  include DataMapper::Resource

  has n, :peeps, :through => Resource

end
