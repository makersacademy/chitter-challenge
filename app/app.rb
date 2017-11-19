ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'bob has one leg'
  register Sinatra::Flash

  get '/' do
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
  @user = User.create(email: params[:Email],
                  username: params[:Username],
                  password: params[:Password],
                  password_confirmation: params[:Password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/tweets/new')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end

  end

  get '/users' do
    @email = session[:email]
    erb :'users/email'
  end

  get '/tweets/new' do
    @user = current_user
    erb :'tweets/new'
  end

  post '/tweets' do
      Tweet.create(text: params[:Tweet],
                  time: Time.now,
                  username: current_user.username)
      p params[:Tweet]
      p current_user

      @tweets = Tweet.all(order: [:time.desc])
      erb :'tweets/index'
  end

  post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/links')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/log_in'
    end
  end

  get '/sessions/sign_out' do
    session[:user_id] = nil
    flash[:sign_out] = 'Thanks for visting!'
    redirect '/sessions/new'
  end

  run! if app_file == $0

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
    end
  end
end
