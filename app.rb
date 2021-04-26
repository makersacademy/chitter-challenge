# frozen_string_literal: true

require_relative './lib/database_connection_setup'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/tweets'
require './lib/user'
require 'uri'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @user = session[:email]
    @tweets = Tweets.all
    erb :index
  end

  post '/newtweet' do
    Tweets.create(params[:newtweet])
    redirect('/')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do 
    session[:email] = User.create(params[:email], params[:password], params[:persons_name], params[:username])
    redirect('/')
  end

  get '/reverse' do
    @tweets = Tweets.reverse
    erb :tweets
  end

  get '/tweets' do
    @tweets = Tweets.all
    erb :tweets
  end

  run! if app_file == $PROGRAM_NAME
end
