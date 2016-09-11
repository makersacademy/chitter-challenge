require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/peep.rb'
require './app/models/user.rb'
require 'dm-timestamps'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
