require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true
  property :email, String, required: true, unique: true
  property :password, BCryptHash
end
