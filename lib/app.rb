require 'sinatra/base'
require_relative 'data_mapper_setup'

class Tweeter < Sinatra::Base
  set :bind, '0.0.0.0'
  enable :sessions
  set :session_secret, "secret"

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
