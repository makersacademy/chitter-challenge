ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'slim'
require 'slim/include'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'helpers'

include Helpers

require_relative 'controllers/users'
require_relative 'controllers/sessions'
