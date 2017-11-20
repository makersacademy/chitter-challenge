class Peep
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :tags, :through => Resource
end
