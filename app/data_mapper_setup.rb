require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'
require_relative 'models/peep'

# DB_URL = "postgres://localhost/chitter_#{ENV['RACK_ENV']}".freeze
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
