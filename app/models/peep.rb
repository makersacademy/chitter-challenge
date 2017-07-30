class Peep
  include DataMapper::Resource

  property :id,      Serial
  property :name,    String
  property :handle,  String
  property :post,    String
end
