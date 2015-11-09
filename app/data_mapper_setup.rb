require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter-challenge_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!

