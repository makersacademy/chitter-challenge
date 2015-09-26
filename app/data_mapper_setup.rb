require 'data_mapper'
require 'dm-validations'
require './app/models/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
