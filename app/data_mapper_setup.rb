require 'data_mapper'
require 'sinatra/base'
require 'dm-validations'
require 'sinatra/flash'

require './app/models/user'
require './app/models/peep'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

# require all models here  e.g require './app/models/etc'
require './app/models/user'

DataMapper.finalize
DataMapper.auto_upgrade!
