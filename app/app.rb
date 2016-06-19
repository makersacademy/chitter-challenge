ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './controllers/user'
require_relative './controllers/peep'
require_relative 'server'
