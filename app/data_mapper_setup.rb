require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/user'
require './app/models/peep'
require './app/models/comment'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
