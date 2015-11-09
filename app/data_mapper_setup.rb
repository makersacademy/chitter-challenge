require 'data_mapper'

require './app/models/user'
require './app/models/message'

db_location = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || db_location)
DataMapper.finalize
