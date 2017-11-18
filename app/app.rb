ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/user'
require_relative './data_mapper_setup'
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
  @current_user = User.new(email: params[:email],
    password: params[:password], password_confirmation: params[:password_confirmation])
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect to('/tweets/new')
    else
      flash.now[:errors] = @current_user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users' do
    @email = session[:email]
    erb :'users/email'
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do

    user = current_user
    user.tweets << Tweet.new(text: params[:Tweet], time: Time.new, user: current_user.email)
    # current_user.save
    @tweets = Tweet.all
    p @tweets
    p user
    erb :'tweets/index'
  end

  run! if app_file == $0

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
    end
  end
end
