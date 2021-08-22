require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/cheet.rb'
require './lib/email.rb'

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
    # setting @post to the posts value, we want to also have a date parameter created here later 
    if @post == ""
      redirect('/add_post')
    else
      # call model to save tweet in DB 
      Cheet.new.create(@post)
      redirect('/cheets')
    end  
  end
  
  get '/sign_up' do 
    erb :signup
  end
  
  post '/signed_up?' do 
    @email = params[:email]
    if @email == ""
      redirect('/sign_up')
    else
      Email.new.add(@email)
      redirect('/sign_up/success')
    end
  end

  get '/sign_up/success' do 
    erb :confirmed
  end 


end 