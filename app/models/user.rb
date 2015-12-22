require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String
  property :password_confirmation, String
end

#DataMapper.setup(:default, "postgres://localhost/chitter_test")
