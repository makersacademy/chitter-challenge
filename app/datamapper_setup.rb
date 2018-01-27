require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/peep'
require './app/models/peep'

ENV['RACK_ENV'] ||= 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
