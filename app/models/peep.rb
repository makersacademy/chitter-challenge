class Peep

  include DataMapper::Resource

  property :id, Serial
  property :post, String
  property :time, String

  has n, :users, through: Resource

end
