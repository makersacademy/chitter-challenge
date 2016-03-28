
require 'sinatra'



ENV['RACK_ENV'] ||= 'development'
RACK_ENV = ENV['RACK_ENV']


require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require 'bcrypt'
require_relative './models/poop'
require_relative './models/user'
require_relative './controllers/user_management'
require_relative './controllers/poops'
require_relative './controllers/sessions'
require_relative  'server'



