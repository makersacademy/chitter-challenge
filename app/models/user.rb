
class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :pass_hash, String
  property :salt, String
end
