require 'sinatra/flash'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

require_relative 'models/user'
require_relative 'models/kweet'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/kwitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
