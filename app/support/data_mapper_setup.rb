require 'data_mapper'
require './app/models/user.rb'
require './app/models/peep.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_andy_#{ENV['RACK_ENV']}")
DataMapper.finalize