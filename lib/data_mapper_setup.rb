require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './model/user'
require_relative './model/twit'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/tweeter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
