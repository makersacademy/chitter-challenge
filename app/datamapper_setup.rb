require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/message'
require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/critter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
