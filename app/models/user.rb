class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, String
end
