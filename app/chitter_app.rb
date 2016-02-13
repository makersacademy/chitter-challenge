ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'models/init'
require_relative 'app_helpers/authentication_helper'

class Chitter < Sinatra::Base
  helpers CurrentUser
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/signup' do
    logged_in?
    erb :'/users/signup'
  end

  get '/users/login' do
    logged_in?
    erb :'/users/login'
  end

  post '/users/signup' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       username: params[:username],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.valid?
      redirect '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/users/signup'
    end
  end

  post '/users/login' do
    user = User.first(email: params[:email])
    success = user.login(params[:password]) if user
    if success
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = "Error: Wrong Username or Password"
      redirect '/users/login'
    end
  end

  delete '/users/logout' do
    flash[:notice] = "Goodbye #{current_user.name}"
    session.clear
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
