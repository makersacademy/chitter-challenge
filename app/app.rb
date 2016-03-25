ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'
require_relative 'models/data_mapper_setup'
require_relative 'models/user'
require_relative 'models/chit'
require_relative 'controllers/chits'
require_relative 'controllers/user'
require_relative 'controllers/session'
