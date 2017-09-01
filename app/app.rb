ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'erb'

require_relative './helpers/chitter_helpers'
require_relative 'data_mapper_setup'
require_relative 'hosting'

require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
