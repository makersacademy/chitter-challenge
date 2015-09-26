require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require './app/models/chit'

DataMapper.finalize
DataMapper.auto_migrate!
