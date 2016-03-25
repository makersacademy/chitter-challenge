ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server'
require_relative 'models/data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'controllers/peeps'
require_relative 'controllers/user'
require_relative 'controllers/session'
