require 'data_mapper'
require 'dm-timestamps'
require 'dm-validations'
require 'sinatra/base'
require 'sinatra/flash'

require './app/models/peep'
require './app/models/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
