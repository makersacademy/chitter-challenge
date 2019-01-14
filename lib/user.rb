require 'data_mapper'
require 'bcrypt'
class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique => true
  property :mail, Text, :unique => true
  property :password, BCryptHash
end
