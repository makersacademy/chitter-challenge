require 'sinatra/base'
require './lib/database_connection_setup'
require './lib/tweets'

class Twitter < Sinatra::Base 

  get '/' do 
    "Hello World"
  end 

  get '/home' do 
    @goliath = Tweets.all.reverse
    p @goliath
    erb :tweets
  end 

  post '/new_tweet' do 
    Tweets.create(tweet: params[:new_tweet])
    redirect '/home'
  end

  post '/tweet/:id/delete' do 
    Tweets.delete(params[:id])
    redirect '/home'
  end 

  run! if app_file == $0
end 