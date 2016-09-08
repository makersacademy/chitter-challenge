require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class User

  include DataMapper::Resource

  property :id,          Serial
  property :name,        String
  property :user_name,   String
  property :email,       String
  property :password,    String

end
