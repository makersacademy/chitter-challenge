require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper::Logger.new $stdout, :debug
DataMapper.setup :default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}"

require './app/models/user'
require './app/models/peep'

DataMapper.finalize

DataMapper.auto_upgrade!
