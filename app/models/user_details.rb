class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, String
  property :password_confirmation, String
end
