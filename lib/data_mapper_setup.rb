require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './model/user'
require_relative './model/twit'

database = ENV['DATABASE_URL'] || "postgres://localhost/tweeter_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, database)
DataMapper.finalize
DataMapper.auto_upgrade!
