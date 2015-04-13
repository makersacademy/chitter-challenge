require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/blabber_#{env}")

require './app/models/blabbs'
require './app/models/user'

DataMapper.finalize

