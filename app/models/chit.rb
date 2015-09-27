class Chit

  include DataMapper::Resource

  property :id,     Serial
  property :post,   String

  has n, :tags, through: Resource

end
