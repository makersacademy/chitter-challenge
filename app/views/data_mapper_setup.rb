require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/chit'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_database_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
