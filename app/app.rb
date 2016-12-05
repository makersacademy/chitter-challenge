ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter_challenge < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    erb :'/index'
  end

  get '/home' do
    erb :'/home'
  end

  post 'home' do
    erb :'/home'
  end

  get '/signup' do
    erb :'/signup'
  end

  get '/signin' do
    erb :'/signin'
  end

  post 'signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/home')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/signup'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/signup_new_user' do
    User.create(email: params[:email],
    password: params[:password])
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
