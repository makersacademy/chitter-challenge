require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true, format: :email_address
  property :password, String, required: true
  property :password_confirmation, String, required: true
end
