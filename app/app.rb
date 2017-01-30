ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require 'pry'

require 'database_cleaner'
require_relative 'data_mapper_setup'

require_relative 'main'
require_relative 'controllers/home'
require_relative 'controllers/session'
require_relative 'controllers/peep'
