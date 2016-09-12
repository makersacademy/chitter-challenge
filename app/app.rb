ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'
require_relative 'server'

require_relative 'controllers/user'
require_relative 'controllers/feed'
require_relative 'controllers/peep'
