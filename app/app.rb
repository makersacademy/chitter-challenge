ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require './data_mapper_setup'

require './app/controllers/users'
require './app/server'


