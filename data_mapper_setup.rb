require 'data_mapper'
require 'dm-validations'
require 'dm-postgres-adapter'

env = ENV['RACK_ENV'] || 'development'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
  require './app/models/peep.rb'
  require './app/models/user.rb'
DataMapper.finalize

env = 'test' ? DataMapper.auto_migrate! : DataMapper.auto_upgrade!

