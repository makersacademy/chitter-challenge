require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'pg'

require_relative 'models/peep'
require_relative 'models/user'

localhost = "postgres://localhost/chitter_database_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || localhost)

DataMapper.finalize

DataMapper.auto_upgrade!
