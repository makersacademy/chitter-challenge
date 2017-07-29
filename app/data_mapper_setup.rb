require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'

postgres_database = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, postgres_database)
DataMapper.finalize
DataMapper.auto_upgrade!
