require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/peep'

DataMapper.finalize
DataMapper.auto_upgrade!
