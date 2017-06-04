require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/user'

databasepath = "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || databasepath)

DataMapper.finalize
DataMapper.auto_upgrade!
