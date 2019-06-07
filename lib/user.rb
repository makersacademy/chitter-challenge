require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,           Serial
  property :username,     String, :unique => true  
  property :password,     BCryptHash
  has n, :peeps
end