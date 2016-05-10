ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra'
require 'tilt/erb'

require_relative 'helpers'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
