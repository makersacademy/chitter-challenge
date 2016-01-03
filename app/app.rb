ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'dotenv'
Dotenv.load

require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative '../lib/send_recover_link'
