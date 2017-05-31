ENV["RACK_ENV"] ||= "development"

require './models/user'
require './models/peep'
require 'sinatra/base'
require './data_mapper_setup.rb'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
