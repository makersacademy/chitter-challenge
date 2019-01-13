ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require './lib/peep'

DataMapper.setup(:default, "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")

DataMapper.finalize
