require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'sinatra/flash'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/kwitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
