require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'
require_relative 'models/peep'

env = ENV['RACK_ENV'] || 'development'

# Separate dev and test dbs not found useful for this execise
# DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.setup(:default, "postgres://localhost/chitter")
DataMapper.finalize
DataMapper.auto_upgrade!
# DataMapper.auto_migrate!
# DataMapper::Logger.new($stdout, :debug)
