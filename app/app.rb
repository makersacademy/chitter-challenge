require 'sinatra/base'
require_relative './models/tweet'


class Twitter < Sinatra::Base
  get '/' do
  end

  get '/twitter' do
    @tweets = Tweet.all
    erb :'index'
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
