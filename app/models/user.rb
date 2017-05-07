require 'dm-postgres-adapter'
require 'data_mapper'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password, String
end

DataMapper.setup(:default, "postgres://localhost/chitter_users")
DataMapper.finalize
DataMapper.auto_upgrade!
