require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'

ENV["RACK_ENV"] ||= "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
