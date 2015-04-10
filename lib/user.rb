class User
  include DataMapper::Resource

  has n, :posts, through: Resource
  
  property :id,              Serial
  property :email,           String
  property :password_digest, Text
  property :name,            String
  property :user_name,       String
end