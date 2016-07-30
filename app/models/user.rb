
class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String
  property :username, String
  property :name, String
end
