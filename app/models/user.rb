class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true
  property :name, String
  property :username, String
  property :password, String
  validates_uniqueness_of :email

end