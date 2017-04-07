class User

  include DataMapper::Resource

  property :username, String
  property :password, String
  property :id,       Serial
  property :name,     Text
  property :email,    Text


end
