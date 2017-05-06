require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/user'

if ENV['RACK_ENV'] == 'test'
  @database = "postgres://localhost/chitter_test"
else
  @database = "postgres://localhost/chitter_development"
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || @database)
DataMapper.finalize
DataMapper.auto_upgrade!
