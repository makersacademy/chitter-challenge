ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

require_relative 'server'

require 'tilt/erb'

require_relative 'controllers/peeps'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
