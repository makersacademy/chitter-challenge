require 'sinatra/base'
require './app/data_mapper_setup'
require './app/models/user'
require 'bcrypt'

ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  enable :sessions
  set :sesion_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @user = session[:username]
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  get '/sign-in' do
    erb :'sign_in'
  end

  post '/register_user' do
    user = User.create(name: params[:name],
           username: params[:username],
           email: params[:email],
           password: params[:password],
           password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    session[:username] = user.username
    redirect '/feed'
  end

  get '/feed' do
    @user = session[:username]
    erb :'feed/index'
  end

  post '/sign-in' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      session[:username] = user.username
      redirect '/feed'
    else
      redirect '/'
    end
  end

  post '/sign-out' do
    session[:user_id] = nil
    session[:username] = nil
    redirect '/'
  end

  # get '/users' do
  #   @user = session[:username]
  #   erb :'users/userpage'
  # end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
