ENV['RACK_ENV'] ||= 'development'

require 'require_all'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
# require_relative 'controllers/app_controller'
# require_relative 'controllers/peep_controller'

require_rel './*.rb'
require_rel './controllers/*'
