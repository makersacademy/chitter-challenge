ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'app_helpers'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  enable :secret_sessions, 'secret'
end
