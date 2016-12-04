require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/user'
require_relative './models/tweet'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/twitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
