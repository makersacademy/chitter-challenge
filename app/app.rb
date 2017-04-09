ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::flash
  use Rack::MethodOverride

  # returns an instance of User for
  # the currently logged in user
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # User sign up
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  # Store user details
  post 'users' do
    @user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:error] = "Password does not match the confirmation"
      erb :'users/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:error] = 'Goodbye!'
    redirect to '/users/new'
  end
  # View peeps
  get '/peeps' do
    erb :'peeps'
  end


end
