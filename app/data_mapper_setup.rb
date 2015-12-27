require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user.rb'


DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.auto_migrate!
DataMapper.finalize
