ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'helpers'

class Chitter < Sinatra::Base
  helpers Helpers

  enable :sessions

  get '/' do
    erb :index
  end

  get '/tweets' do
    @tweets = Tweet.all_in_reverse_order
    erb :tweets
  end

  post '/new_user' do
    user = User.create(username: params[:username], email: params[:email],
                        password: params[:password])
    session[:user_id] = user.id
    redirect '/tweets'
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
