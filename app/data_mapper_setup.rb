require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/users'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
