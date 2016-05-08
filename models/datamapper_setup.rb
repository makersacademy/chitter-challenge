require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require_relative 'user'
require_relative 'peep'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
