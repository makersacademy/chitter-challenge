
class User
  include DataMapper::Resource

  attr_reader :name
  attr_accessor :password

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_digest, Text
  #has n, :post

end