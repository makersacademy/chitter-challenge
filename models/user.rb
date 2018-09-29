class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user, String
  property :email, String
  property :password, String
end
