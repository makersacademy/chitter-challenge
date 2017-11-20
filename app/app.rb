ENV['RACK_ENV'] ||= 'development'

require 'require_all'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_rel './*.rb'
require_rel './controllers/*'
require_rel './helpers/*'
