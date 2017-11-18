require 'dm-postgres-adapter'
require 'data_mapper'
require_relative 'peep'



DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
