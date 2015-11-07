require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/user.rb'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
