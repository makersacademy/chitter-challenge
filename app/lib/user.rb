class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true
  property :password, Text
  property :username, Text, :unique => true

  has n, :cheets

end