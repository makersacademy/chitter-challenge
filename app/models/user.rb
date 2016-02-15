class User
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String
  property :email,      String, unique: true 
  property :username,   String, unique: true
  property :password,   String
end