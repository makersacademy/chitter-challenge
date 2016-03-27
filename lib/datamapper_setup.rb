require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'user'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
