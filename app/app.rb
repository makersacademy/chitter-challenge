
ENV['RACK_ENV'] ||= 'development'


require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controller/users'
require_relative 'controller/sessions'
require_relative 'controller/cheeps'
