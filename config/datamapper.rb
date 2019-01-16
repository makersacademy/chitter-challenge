require './lib/user'
require './lib/message'
require './lib/comment'
require 'data_mapper'

p "environment is #{ENV['RACK_ENV']}"

DataMapper.setup(:default, "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
DataMapper.finalize
