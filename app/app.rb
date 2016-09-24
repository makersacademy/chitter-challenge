require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

ENV["RACK_ENV"] ||= 'development'
