require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/users'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter-challenge_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!

