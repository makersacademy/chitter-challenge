ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/peep_controller'
require_relative 'controllers/session_controller'
require_relative 'controllers/users_controller'
