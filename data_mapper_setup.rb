require 'data_mapper'
require 'rubygems'
require 'dm-core'
require 'dm-timestamps'
require_relative 'app/models/peep.rb'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.
setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

# require 'sinatra-flash'


DataMapper.finalize

DataMapper.auto_upgrade!
