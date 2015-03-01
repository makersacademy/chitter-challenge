require 'data_mapper'
require 'rack-flash'
require 'sinatra'
require 'sinatra/partial'
require './app/lib/tweet'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!