ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'rest_client'
require_relative 'dm_setup'
require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/peeps'
