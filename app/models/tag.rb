class Tag
  include DataMapper::Resource

  has n, :peeps, through: Resource, constraint: :destroy

  property :id, Serial
  property :name, String
end
