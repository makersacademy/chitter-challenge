require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter_Messages < Sinatra::Base   #do I always have to configure this? 
  configure :development do
    register Sinatra::Reloader
  end 

  get '/' do
    erb :index
  end 

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end 

  post '/peeps' do
    p params
    Peep.create(content: params[:new_peep])
    redirect '/peeps'
  end 

  get '/peeps/new' do 
    erb :'peeps/new'
  end 
  
  #start the server if ruby file executed directly
  run! if app_file == $0
end