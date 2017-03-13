ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'dm_config'
require_relative 'server'

require_relative 'controllers/peeps'
require_relative 'controllers/hashtags'
require_relative 'controllers/sessions'
