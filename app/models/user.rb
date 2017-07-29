require 'data_mapper'
require 'dm-postgres-adapter'

class User

  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, required: true, unique: true
  property :password, String

end
