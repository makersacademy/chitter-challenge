require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'

#Database connection setup
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

#verification
DataMapper.finalize

#build new columns/tables
DataMapper.auto_upgrade!
