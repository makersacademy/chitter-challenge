require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

require_relative './models/user'
require_relative './models/peep'

env = ENV['RACK_ENV'] || 'development'

# DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'

DataMapper.finalize
