require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
