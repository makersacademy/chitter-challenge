require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'tweet'

class TwitterClone < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/tweets'
  end

  get '/tweets' do
    @tweets = Tweet.all
    erb(:'tweets/index')
  end

  post '/tweets' do
    Tweet.post(tweet: params[:tweet])
    redirect '/tweets'
  end
  
  run! if app_file == $0
end
