require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper::Logger.new $stdout, :debug
DataMapper.setup :default, "postgres://localhost/chitter_#{env}"

require './app/models/user'

DataMapper.finalize

DataMapper.auto_migrate!
