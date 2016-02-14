ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/signup'
require_relative 'controllers/signin'
require_relative 'controllers/signout'
require_relative 'controllers/peeps'
