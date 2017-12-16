ENV['RACK_ENV'] ||= 'development'

require 'sinatra'
require 'sinatra/base'
require './app/models/tweet'
require_relative 'data_mapper_setup'

class Twitter < Sinatra::Base

  get '/tweets' do
    @tweets = Tweet.all
    erb :'tweets/tweet_list'
  end

  get '/tweets/new' do
    erb :'tweets/new_tweet'
  end

  post '/tweets' do
    tweet = Tweet.create(message: params[:message])
    p tweet.created_at
    p tweet.created_at.strftime("%A, %d %b %Y %l:%M %p")
    p tweet.time_posted
    redirect to('/tweets')
  end

end
