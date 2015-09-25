require 'data_mapper'
require 'dm-validations'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

# require all models here  e.g require './app/models/etc'

DataMapper.finalize

DataMapper.auto_upgrade!
