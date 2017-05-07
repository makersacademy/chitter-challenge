class User

  include DataMapper::Resource

  has n, :peeps

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String

end
