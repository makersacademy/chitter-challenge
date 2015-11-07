require 'data_mapper'

require './app/models/user'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bmanager_#{ENV['RACK_ENV']}")
DataMapper.finalize
