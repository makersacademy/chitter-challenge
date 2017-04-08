ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Kitter < Sinatra::base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash









end
