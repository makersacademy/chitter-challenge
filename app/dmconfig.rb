require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
DataMapper.finalize
