ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/flash'

require_relative 'server'
require_relative 'data_mapper_setup'

require_relative 'controllers/users.rb'
require_relative 'controllers/sessions.rb'
require_relative 'controllers/messages.rb'
