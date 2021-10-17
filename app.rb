require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class Chitter_Messages < Sinatra::Base   #do I always have to configure this? 
  configure :development do
    register Sinatra::Reloader
  end 

  get '/' do
    erb :index
  end 

  get '/peeps' do
    erb :'peeps/index'
  end 

  post '/peeps' do
    redirect '/bookmarks'
  end 

  get '/peeps/new' do 
    erb :'peeps/new'
  end 


  
  #start the server if ruby file executed directly
  run! if app_file == $0
end