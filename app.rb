require 'sinatra/base'

class Twitter < Sinatra::Base 

  get '/' do 
    "Hello World"
  end 

  get '/home' do 
    $goliath = Tweets.all
  end 

  run! if app_file == $0
end 