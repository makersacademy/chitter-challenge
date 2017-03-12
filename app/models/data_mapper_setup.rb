require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './user'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_development")
DataMapper.finalize
DataMapper.auto_upgrade!
