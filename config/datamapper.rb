ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require './lib/user'
require './lib/peep'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
