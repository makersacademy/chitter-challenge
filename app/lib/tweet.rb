class Tweet

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :user, String
  property :post, String

end