ENV['RACK_ENV'] ||= 'development'

require "sinatra/base"
require "sinatra/flash"
require "sinatra/partial"
require "tilt/erb"

require_relative "data_mapper_setup"

require_relative "server"
require_relative "controllers/users"
require_relative "controllers/sessions"
