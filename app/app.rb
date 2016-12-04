ENV['RACK_ENV'] ||='development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/tweet'
require_relative './models/user'


class Twitter < Sinatra::Base

  register Sinatra::Flash
  enable :session
  set :session_secret, 'super secret'


  get '/' do
  end

  get '/twitter' do
    @tweets = Tweet.all
    erb :'index'
  end

  get '/users/new' do
    @user = User.new
    erb :'sign_up'
  end


  post '/users' do
    @user = User.create(email: params[:email], username: params[:username],
              password_method2: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id]= @user.id
      redirect '/twitter'
    else
      # flash.now[:notice] = "Cannot sign up: password and password confirmation do not match"
      flash.now[:errors] = @user.errors.full_messages
      erb :'sign_up'
    end
  end

  get '/tweets/new' do
    erb :'new_tweet'
  end

  post '/twitter' do
    Tweet.create(message: params[:message])
    redirect '/twitter'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
