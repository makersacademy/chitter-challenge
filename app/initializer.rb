require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/message'

DataMapper.setup(:default, "postgres://localhost/critter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
