class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :user_name,  String
  property :post,       String

end