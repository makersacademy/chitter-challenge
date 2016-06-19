ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'tilt/erb'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative 'models/message'
require_relative 'models/user'
require_relative 'models/reply'

require_relative 'server'
require_relative 'controllers/messages'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/index'
