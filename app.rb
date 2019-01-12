require 'sinatra/base'
require 'sinatra/activerecord'
require './lib/user'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do 
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    user = User.create({firstname: params[:firstname], surname: params[:surname], username: params[:username], email: params[:email], password: params[:password]})
    session[:id] = user.id
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
      #CAN CREATE LATER 
      redirect '/error'
    end
  end

  get '/profile/:id' do
    @user = User.find(params[:id])
    erb(:profile)
  end

  get '/peep' do
    erb(:peep)
  end

  post '/peep' do
  end

  delete '/sessions' do
    session.delete(:id)
    redirect '/'
  end

end