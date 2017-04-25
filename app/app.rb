ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'
require 'pry'

class Kitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/meows'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                      username: params[:username],
                      name: params[:name],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/meows'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    @disable_sign_in_button = true
    erb :'sessions/new'
  end

  post '/sessions' do
  user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/meows'
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Bye Bye Kitty!'
    redirect '/meows'
  end

  get '/meows' do
    @meows = Meow.all(order: [:time.desc])
    @user = User.first
    erb :'meows/index'
  end

  get '/meows/new' do
    if current_user == nil
      flash[:errors] = ["You must sign in to meow"]
      redirect 'sessions/new'
    end
    erb :'meows/new'
  end

  post '/meows' do
  time = Time.new
  meow = Meow.new(message: params[:message], time: time)
    if current_user == nil
      flash[:errors] = ["You must sign in to meow"]
      redirect 'sessions/new'
    else
      meow.user = current_user
      meow.save
      redirect '/meows'
    end
  end

  run! if app_file == $0
end
