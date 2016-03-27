ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'
require_relative 'controllers/sign_up'
require_relative './models/data_mapper_setup'
require_relative 'controllers/chitter_feed'
require_relative 'controllers/session'
