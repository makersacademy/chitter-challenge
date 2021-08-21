require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/add_post' do
    erb :newpost
  end 

  get '/cheets' do 
    erb :cheets
  end 

  post '/confirmed' do 
    @post = params[:post]
    p @post
    if @post == ""
      redirect('/add_post')
    else
      erb :cheets
    end  
  end 

end 