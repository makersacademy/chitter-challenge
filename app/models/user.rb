class User
  include DataMapper::Resource

  property :id,       Serial
  propery :name,      String
  property :username, String, :unique => true
  property :email,    String, :unique => true
  propery :password,  BCryptHash

end
