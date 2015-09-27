require 'data_mapper'
require 'dm-validations'
require 'sinatra/base'
require 'sinatra/flash'
require 'dm-timestamps'

# require all models here  e.g require './app/models/etc'
require './app/models/user'
require './app/models/peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!
