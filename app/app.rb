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
    erb :user_timeline
  end

  post '/post/new' do
    @user_id = "Test User"
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