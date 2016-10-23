class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :user_name, String, :required => true
  property :email, String, :required => true
  has n, :posts

end
