require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/user'
require_relative './models/cheep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
DataMapper.finalize
