ENV['RACK_ENV'] ||= 'development'

require 'data_mapper'
require './lib/user'

DataMapper.setup(:default, "postgres://localhost/messenger_#{ENV['RACK_ENV']}")

DataMapper.finalize
