require 'sinatra/base'
require './lib/peep'
require_relative './scripts/database_connection_setup.rb'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/timeline' do
    @timeline = Peep.timeline
    erb :index
  end

  get '/timeline/home' do 
    @user = session[:user]
    @timeline = Peep.timeline
    erb :user_timeline
  end

  get '/sessions' do
    erb :sessions_new
  end

  post '/sessions/new' do
    session[:user] = User.authenticate(params[:email], params[:password])
    redirect 'timeline/home'
  end

  post '/post/new' do
    if session[:user] != nil
      user = session[:user]
      @user_id = user.id      
    else
      @user_id = 'Anonymous'
    end
    Peep.add_post(@user_id, params[:post])
    redirect '/timeline'
  end

  get '/registration' do
    erb :registration
  end

  post '/registration/new' do
    session[:user] = User.register(params[:name], params[:email], params[:username], params[:password])
  redirect '/timeline/home'
  end
end