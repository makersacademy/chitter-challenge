ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'controllers/signup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'secretchitter'
  set :method_override, true
  register Sinatra::Flash
  # register Sinatra::Partial
  # set :partial_template_engine, :erb
  helpers do

    def current_user
      @current_user ||= User.get(session[:id])
    end

    def login_error
      flash.now['login_error'] = 'Username or password incorrect'
    end

  end

  get '/' do
    erb :'/peeps'
  end

  delete '/signout' do
    session[:id].clear
    flash.next[:logout_message] = 'Goodbye!'
    redirect '/'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
