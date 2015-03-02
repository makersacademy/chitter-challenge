class Tweet

  include DataMapper::Resource

  property :id, Serial
  property :user, String
  property :post, String, :length => 140

end