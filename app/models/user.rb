require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, Text
  property :email, Text
  property :password, Text
end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
