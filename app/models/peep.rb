require_relative 'user'

class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :user_name,  String
  property :name,       String
  property :post,       String, :length => 1..140

end