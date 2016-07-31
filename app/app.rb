ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'sinatra'

require_relative 'database_setup'

require_relative 'server'
require_relative 'controllers/peeps'
require_relative 'controllers/sessions'
require_relative 'controllers/accounts'
