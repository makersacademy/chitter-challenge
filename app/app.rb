ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'sinatra/base'
require './app/models/tweet'
require './app/models/user'
require_relative 'data_mapper_setup'

class Twitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/tweets' do
    @tweets = Tweet.all.reverse
    erb :'tweets/tweet_list'
  end

  get '/tweets/new' do
    erb :'tweets/new_tweet'
  end

  post '/tweets' do
    time = Time.now.strftime("%A, %d %b %Y %l:%M %p")
    Time.now.strftime("%A, %d %b %Y %l:%M %p")
    tweet = Tweet.create(message: params[:message], time: time)
    redirect to('/tweets')
  end

  get '/users/new' do
    erb :'users/new_user'
  end

  post '/users' do
    p 'reaches /users'
    user = User.create(name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/tweets')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
