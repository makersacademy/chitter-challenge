ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  
  get '/' do
    redirect '/main'
  end
  
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end
  
  post '/users' do
    @user = User.new(email: params['email'],
                password: params['password'],
                name: params['name'],
                username: params['username'], 
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/main'
    else
      flash.now[:warning] = "Password confirmation does not match"
      erb :'/users/new'
    end
  end
  
  get '/main' do
    erb :main
  end
  
  
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

 
  run! if app_file == $0
end
