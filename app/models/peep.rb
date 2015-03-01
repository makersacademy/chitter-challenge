class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :user_name,   String
  property :post,       String

end