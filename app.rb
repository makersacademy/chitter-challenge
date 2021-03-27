require 'sinatra/base'

class Twitter < Sinatra::Base 

  get '/' do 
    "Hello World"
  end 

  get '/home' do 
    $goliath = Tweets.all
    erb :tweets
  end 

  run! if app_file == $0
end 