require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'post'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
