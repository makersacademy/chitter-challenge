require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

# require all models in data_mapper_setup

require './app/models/user.rb'

DataMapper.finalize

DataMapper.auto_upgrade!