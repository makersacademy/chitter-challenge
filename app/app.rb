ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'data_mapper'
require 'capybara'

require_relative 'data_mapper_setup'
require_relative 'controllers/app_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/tweet_controller'
require_relative 'server'
