require 'sinatra/base'
require 'sinatra'
require 'sinatra/flash'
require './lib/database_connection_setup'
require './lib/tweets'
require './lib/user'
require 'uri'

class Twitter < Sinatra::Base 
  enable :sessions
  register Sinatra::Flash

  get '/' do 
    erb :index
  end 

  get '/new_user' do
    erb :sign_up
  end 

  post '/users' do 
    user = User.create(name: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/home'
  end 

  get '/log_in' do 
    erb :log_in
  end 

  post '/user_log_in' do 
    user = User.authenticate(name: params[:username], password: params[:password])
    
    if user 
      session[:user_id] = user.id
      redirect '/home'
    else 
      flash[:notice] = 'Please check your username or password.'
      redirect '/log_in'
    end 
  end 

  get '/home' do 
    @user = User.find(session[:user_id])
    @goliath = Tweets.all.reverse
    erb :tweets
  end 

  post '/new_tweet' do 
    Tweets.create(tweet: params[:new_tweet])
    redirect '/home'
  end

  post '/tweet/:id/delete' do 
    Tweets.delete(params[:id])
    redirect '/home'
  end 

  post '/log_out' do 
    session.clear
    flash[:notice] = "You are logged out!"

    redirect '/'
  end 

  run! if app_file == $0
end 
