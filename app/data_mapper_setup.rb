require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")


require './app/models/peep'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
