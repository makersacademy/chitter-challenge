require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password, Text

end
