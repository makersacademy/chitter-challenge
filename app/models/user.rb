require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password, String
  property :name, String
  property :username, String
end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
