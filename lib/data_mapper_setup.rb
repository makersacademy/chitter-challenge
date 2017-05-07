require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require 'dm-validations'

require_relative 'user'
require_relative 'message'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_database_#{ENV['RACK_ENV']}")
DataMapper.finalize
