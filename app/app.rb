ENV["RACK_ENV"] ||= "development"
require 'date'
require 'sinatra/base'
require 'sinatra/flash'
require 'timecop'
require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
