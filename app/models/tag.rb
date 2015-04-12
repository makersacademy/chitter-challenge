class Tag

  include DataMapper::Resource

  property :id,   Serial
  property :name, String

  has n, :notes, through: Resource
  has n, :replies, through: Resource

end