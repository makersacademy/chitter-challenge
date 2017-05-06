require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require './app/models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
DataMapper.auto_migrate!
