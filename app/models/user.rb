require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String, required: true, format: :email_address
  property :password, String
  property :password_confirmation, String


end

