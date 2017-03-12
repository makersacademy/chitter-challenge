class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String, required: true

  has n, :tags, :through => Resource, constraint: :destroy

end
