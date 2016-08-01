ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'datamapper_config'

require_relative 'server'
require_relative 'controlers/user'
require_relative 'controlers/session'
require_relative 'controlers/chitter'
