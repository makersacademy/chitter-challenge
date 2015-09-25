require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/models/user'

DataMapper.finalize
DataMapper.auto_upgrade!