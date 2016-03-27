ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'tilt/erb'


require_relative './models/user'
require_relative './models/peep'
require_relative 'data_mapper_setup'

require_relative 'server'
require_relative './controllers/users'
require_relative './controllers/sessions'
require_relative './controllers/peeps'
