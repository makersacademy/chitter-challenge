require 'sinatra/base'
# require 'sinatra'
require_relative './lib/user'
require_relative './lib/tweet'

class TwitterClone < Sinatra::Base

  get '/' do
    erb :"index"
  end

  get '/create_account' do
    User.create(name: params[:name], user_name: params[:user_name], email: params[:email], password: params[:password])
    redirect '/users'
  end

  get '/users' do
    @users = User.all
    erb :"users"
  end

  get '/create_tweet' do
    @tweets = Tweet.all
    Tweet.create(tweet: params[:tweet])
    erb :"/index"
  end

  run! if app_file == $0

end
