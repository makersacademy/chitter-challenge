require_relative 'models/user/new.rb'
require 'data_mapper'
require 'dm-postgres-adapter'
env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter-1#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
