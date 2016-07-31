require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/user'
require_relative './models/poop'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "postgres://localhost/shitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
