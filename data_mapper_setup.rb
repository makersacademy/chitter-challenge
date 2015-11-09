require 'data_mapper'
require 'dm-postgres-adapter'


#require models
require './app/models/user'
require './app/models/post'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize