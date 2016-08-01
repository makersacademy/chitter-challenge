require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/lib/time_string'

require_relative 'server'
require_relative 'controllers/chits'
require_relative 'controllers/sessions'
require_relative 'controllers/user'
