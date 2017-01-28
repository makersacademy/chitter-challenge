require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

class Tweeter < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"

  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    user = User.create(params)
    if user.valid?
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'/user/new'
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
