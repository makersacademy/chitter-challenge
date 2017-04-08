ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride


  get '/users/new' do #sign up
    @user = User.new
    erb :'users/new'
  end

  post '/users' do # user goes to this page after signing up
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to "/hub"
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/hub' do
    erb :hub
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])

    if @user
      session[:user_id] = @user.id
      redirect to "/hub"
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "See you later!"
    redirect to "/sessions/new"
  end



  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end