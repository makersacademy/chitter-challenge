ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sanitize'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/messages'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
