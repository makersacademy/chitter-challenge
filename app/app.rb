ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup.rb'
require 'sinatra/flash'
require 'sinatra/partial'
require 'date'

require_relative 'server'
require_relative 'controllers/sessions'
require_relative 'controllers/login'
require_relative 'controllers/users'
require_relative 'controllers/stream'



 
  
  
  
  
  
  
 
