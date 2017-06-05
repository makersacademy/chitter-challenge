ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'datamapper_config'

require_relative 'server'
require_relative 'controllers/messages'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
