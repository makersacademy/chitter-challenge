require './lib/user'
require 'data_mapper'

DataMapper.setup(:default, "postgres://localhost/chitter_app_development")
DataMapper.finalize
DataMapper.auto_migrate!