require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/user.rb'
require './app/models/peep.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
