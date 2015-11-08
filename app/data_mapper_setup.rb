require 'data_mapper'

require './app/models/user'
require './app/models/message'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
