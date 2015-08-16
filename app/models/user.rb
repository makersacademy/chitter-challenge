class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password, Text

  validates_presence_of :email
  validates_presence_of :password
end