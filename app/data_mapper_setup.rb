require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/user'
require_relative './models/roll'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/ricker_#{ENV['RACK_ENV']}")
DataMapper.auto_upgrade!
DataMapper.finalize
