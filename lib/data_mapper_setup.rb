require 'data_mapper'
require './lib/models/peep'
require './lib/models/user'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!
