ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/user'
require_relative 'models/tweet'
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
  @current_user = User.create(email: params[:Email],
    password: params[:Password], password_confirmation: params[:Password_confirmation])
    if @current_user.save
      session[:user_id] = @current_user.id
      session[:email] = @current_user.email
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
    @user = current_user
    erb :'tweets/new'
  end

  post '/tweets' do
    user = current_user
    user.tweets << Tweet.new(text: params[:Tweet], time: Time.new, user: current_user)
    @tweets = Tweet.all
    # tweet.save
    erb :'tweets/index'
  end

  run! if app_file == $0

  helpers do
    def current_user
     @current_user ||= User.get(session[:user_id])
    end
  end
end
