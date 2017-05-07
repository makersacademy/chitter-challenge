require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!
