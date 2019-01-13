require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true
  property :username, String, :unique => true
  property :password, BCryptHash

end
