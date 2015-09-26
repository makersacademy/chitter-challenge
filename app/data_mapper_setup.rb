require 'data_mapper'
require 'sinatra/base'
require 'dm-validations'

require './app/models/user'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

# require all models here  e.g require './app/models/etc'
require './app/models/user.rb'

DataMapper.finalize

DataMapper.auto_upgrade!
