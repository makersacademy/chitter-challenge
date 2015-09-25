require 'data_mapper'
require './app/models/link'
require './app/models/tag'
require './app/models/user'
require 'dm-validations'
# require 'sinatra-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
