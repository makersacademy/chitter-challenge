ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
# require 'sinatra/partial'
require_relative 'data_mapper_setup'

require_relative 'helpers'
require_relative 'server'
require_relative 'controllers/index'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

require 'tilt/erb'
