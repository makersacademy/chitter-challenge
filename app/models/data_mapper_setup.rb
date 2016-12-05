require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './user'
require_relative './tweet'


DataMapper.setup(:default, ENV['DATABASE_URL'] ||= "postgres://localhost/twitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_updgrade!
