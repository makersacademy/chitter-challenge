require 'sinatra/base'
require_relative 'models/user'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
    def login
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        redirect '/home'
      else
        redirect '/home'
      end
    end
  end

  get '/' do
    redirect '/home'
  end

  get '/home' do
    current_user
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end
  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    login
  end

  post '/home' do
    user = User.create(name: params[:name],
    username: params[:username],
    email: params[:email],
    password: params[:password])
    session[:user_id] = user.id
    user.save
    redirect '/home'
  end

  run! if app_file == $PROGRAM_NAME
end
