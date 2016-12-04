ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user.rb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/users/sign-up' do
    @user = User.new
    erb :sign_up
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/chitter')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitter')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/chitter' do
    erb :chitter
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye :)'
    redirect to '/sessions/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
