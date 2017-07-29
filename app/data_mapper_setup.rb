require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require_relative 'models/peep'


DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
