require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/chitter_feed' do
    erb :chitter_feed
    #pass information from database to views 
  end
end