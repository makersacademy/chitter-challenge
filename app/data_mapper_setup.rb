require 'data_mapper'
require 'dm-validations'
require './app/models/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_app_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
