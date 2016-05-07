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

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/register_user' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      @current_user = User.get(session[:user_id])
      redirect "/users/#{user.username}"
    else
      redirect '/'
    end
  end

  get '/users/:username' do
    @user = User.first(username: params[:username])
    erb :'users/userpage'
  end



  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
