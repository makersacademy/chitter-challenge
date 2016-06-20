ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/flash'

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/signup'
require_relative 'controllers/peeps'
require_relative 'controllers/logout'
require_relative 'controllers/login'
