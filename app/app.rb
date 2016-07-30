ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/cheeps'
require_relative 'controllers/sessions'