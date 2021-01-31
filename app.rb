require 'sinatra/base'

class ChitterChallenge < Sinatra::Base 

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do 
    erb :peep_create
  end

  post '/peeps' do
  end
  
  run! if app_file == $0
end