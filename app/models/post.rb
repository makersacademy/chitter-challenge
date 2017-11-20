ENV['RACK_ENV'] = 'test'

class Post
  include DataMapper::Resource

  property :id,         Serial
  property :title,      String
  property :post,       String
  property :name,       String
  property :created_at, DateTime

end
