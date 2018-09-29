require 'data_mapper'
require './lib/message'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/twittarr_#{env}")


DataMapper.finalize

DataMapper.auto_upgrade!