require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

require_relative 'models/user'

database = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || database)

DataMapper.finalize

DataMapper.auto_upgrade!
