require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
DataMapper.finalize
