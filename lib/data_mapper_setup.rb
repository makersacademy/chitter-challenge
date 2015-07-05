env = ENV['RACK_ENV'] || 'test'
require 'data_mapper'
require 'dm-postgres-adapter'

  DataMapper::Logger.new($stdout, :debug)

  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
  require './lib/models/user'

  DataMapper.finalize

  DataMapper.auto_migrate!
