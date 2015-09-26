require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base 

  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]  
    end
  end

  get '/' do
    erb :feed
  end

  get '/sessions/sign_up' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:errors] = ['Email/password combination incorrect']
      erb :'/sessions/new'
    end
  end

  post '/sessions/sign_up' do
    @user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/')
    else
      flash[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  post '/sessions' do
    @user = nil
    session.clear
    flash[:goodbye] = "Goodbye!"
    redirect('/')
  end

  run! if app_file == $0
end
