require 'data_mapper'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

DataMapper::Logger.new($stdout, :debug)

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.finalize
DataMapper.auto_upgrade!
