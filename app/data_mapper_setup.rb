require 'data_mapper'
require './app/models/user'
require './app/models/peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
