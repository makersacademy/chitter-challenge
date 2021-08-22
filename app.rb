require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require 'cheet'

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
    @cheets = Cheet.new.all 
    erb :cheets
  end 

  post '/confirmed' do 
    @post = params[:post]
    p @post
    if @post == ""
      redirect('/add_post')
    else
      # call model to save tweet in DB 
      redirect('/cheets')
    end  
  end 

end 