
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/models/user'


DataMapper.auto_upgrade!

DataMapper.finalize