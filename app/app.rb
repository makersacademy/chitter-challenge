ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'dm-postgres-adapter'
require 'tilt/erb'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/sessions'
require_relative 'controllers/register'
require_relative 'controllers/home'
require_relative 'controllers/peep'
require_relative 'controllers/logout'
