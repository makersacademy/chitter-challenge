require 'data_mapper'
# require 'dm-postgres-adapter'
# require 'dm-migrations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, Text
  property :password_confirmation, Text

end
