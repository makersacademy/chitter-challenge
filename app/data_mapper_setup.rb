require 'data_mapper'
require 'dm-postgres-adapter'

database_name = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || database_name)
DataMapper.finalize
