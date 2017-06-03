require 'data_mapper'
require 'dm-postgres-adapter'

#require_relative 'each model'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
