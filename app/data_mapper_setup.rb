require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/message.rb'
require_relative 'models/user.rb'

# DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
