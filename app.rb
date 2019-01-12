require 'sinatra/base'
require 'sinatra/activerecord'
require './lib/user'
require 'pry'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do 
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
    
  end

  post '/signup' do
    user = User.create({firstname: params[:firstname], surname: params[:surname], username: params[:username], email: params[:email], password: params[:password]})
    if user.valid? 
      session[:id] = user.id
    else
      
    end
    redirect '/signin'
  end

  get '/signin' do
   erb(:signin)
  end

  post '/signin' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:id] = user.id
      redirect("/profile/#{session[:id]}")
    else
      redirect '/error'
    end
  end


  get 'profile/:id' do
  end


end