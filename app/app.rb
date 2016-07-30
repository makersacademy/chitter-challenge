ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super duper secret muahaha'

  register Sinatra::Flash

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end
  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(username: params[:username],
                      name: params[:name],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/feed'
    else
      flash.now[:error] = user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/feed' do
    erb :'feed/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
