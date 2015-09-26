require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

# require './app/models/link'
# require './app/models/tag'
require './app/models/user_model'

DataMapper.finalize
