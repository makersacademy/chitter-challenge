require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/blabber_#{env}")

require_relative 'models/blabbs'

DataMapper.finalize

DataMapper.auto_upgrade!