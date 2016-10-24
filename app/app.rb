ENV['RACK_ENV'] ||= 'development'

require './app/models/user'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_name] = user.user_name
    if user.save
      redirect '/home'
    else
      flash.now[:notice] = "Passwords do not match"
      erb :'users/new'
    end
  end

  get '/home' do
    @current_user_name = session[:user_name]
    erb :home
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    if user = User.authenticate(params[:email], params[:password])
      session[:user_name] = user.user_name
      redirect '/home'
    else
      flash.now[:notice] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
