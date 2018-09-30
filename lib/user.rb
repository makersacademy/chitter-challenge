class User
  include DataMapper::Resource
  has n, :messages
  property :id,         Serial
  property :name,     String
  property :password,   String
  property :email,      String
  property :username,   String
end
