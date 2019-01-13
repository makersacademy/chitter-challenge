require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true
  property :password, BCryptHash
  property :name, String
  property :username, String, :unique => true

  has n, :peep


end
