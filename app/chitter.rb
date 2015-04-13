require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :sessions
  set :session_secret, 'super_secret'
  use Rack::Flash
  use Rack::MethodOverride

  helpers do
    def maker
      @maker ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  require './app/controllers/index'
  require './app/controllers/chits'
  require './app/controllers/users'

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
