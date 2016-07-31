class Post
  include DataMapper::Resource

  # belongs_to :user

  property :id, Serial
  property :firstname, String
  property :username, String
  property :post, String, length: 140

end
