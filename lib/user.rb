class User
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :name, String
  property :username, String
  property :email, String
  property :password, String

  has n, :peeps
end
