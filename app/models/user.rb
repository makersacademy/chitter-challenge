class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password, String

  validates_uniqueness_of(:username, :email)

end
