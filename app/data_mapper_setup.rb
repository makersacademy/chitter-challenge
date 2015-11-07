require 'data_mapper'
require 'dm-postgres-adapter'
DataMapper::Property::String.length(255)

require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
