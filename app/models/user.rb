require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, unique: true
  property :password, String
  property :password_confirmation, String
end
