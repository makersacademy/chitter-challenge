require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'pg'

require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_database_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_upgrade!
