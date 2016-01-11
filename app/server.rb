ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'rubygems'
require 'rake'

require_relative 'data_mapper_setup'
require_relative 'controllers/log_in_out'
require_relative 'controllers/register'
require_relative 'controllers/peeps'
require_relative 'controllers/comment'
