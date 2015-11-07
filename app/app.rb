require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'potato'

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_check])
    session[:user_id] = user.id
    redirect user.valid? ? '/home' : '/signup/error'
  end

  get '/signup/error' do
    erb :'signup/error'
  end

  get '/login' do
    redirect :home
  end

  get '/index' do
    erb :index
  end

  get '/home' do
    erb :home
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end
