ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'here be dragons'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'home/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                      user_name: params[:user_name],
                      email: params[:email],
                      password: params[:password])
    # session[:user_id] = user.id
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:notice] = "Email is already taken"
      erb :'users/new'
    end
    # redirect to('/')
  end

end
