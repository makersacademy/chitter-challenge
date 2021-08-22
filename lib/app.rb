require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'twitter_clone'

class TwitterClone < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # enable :method_override

  get '/' do
    redirect '/tweets'
  end

  get '/tweets' do
    @tweets = Tweet.all
    erb(:'tweets/index')
  end

  post '/tweets' do
    Twitter.post(tweet: params[:tweet])
    redirect '/tweets'
  end

  delete '/tweets' do
    redirect '/tweets'
  end

  put '/tweets' do
    redirect '/tweets'
  end
  
  run! if app_file == $0
end