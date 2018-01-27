ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/tweets' do
    @tweets = Tweet.all_in_reverse_order
    erb :tweets
  end

  post '/tweets' do
    redirect 'tweets'
  end

  post '/tweets/new' do
    tweet = Tweet.first_or_create(subject: params[:subject], text: params[:text])
    redirect '/tweets'
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end
end
