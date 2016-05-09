require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep'
require_relative 'models/user'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.auto_migrate! if ENV['RACK_ENV'] == "test"
DataMapper.finalize
