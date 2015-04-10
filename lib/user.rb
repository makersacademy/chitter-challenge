class User
  include DataMapper::Resource

  has n, :posts, through: Resource
  
  property :id,              Serial
  property :email,           String
  property :password,        Text
  property :name,            String
  property :username,        String
end