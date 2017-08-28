
class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :pass_hash, String

  has n, :posts, through: Resource
end
