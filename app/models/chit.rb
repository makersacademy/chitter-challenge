class Chit

  include DataMapper::Resource

  property :id,     Serial
  property :post,   String
  property :handle, String

end
