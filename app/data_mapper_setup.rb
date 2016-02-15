require 'data_mapper'
require 'dm-postgres-adapter'
# require "dm_noisy_failures"

require_relative 'models/user'
require_relative 'models/peep'

# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
