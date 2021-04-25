# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/tweets'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @tweets = Tweets.all
    erb :index
  end

  post '/newtweet' do
    Tweets.create(params[:newtweet])
    redirect('/')
  end

  post '/newuser' do
    User.create(params[:email], params[:password])
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
