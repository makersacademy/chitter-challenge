require 'sinatra/base'
require_relative './lib/message'
require_relative './lib/user'
require './database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :"users/new"
  end

  get '/messages' do
    @user = User.find(session[:user_id])
    @messages = Message.all
     erb(:'messages/index')
  end

  post '/messages/new' do
    Message.create(text: params[:text], time: Time.now)
    redirect '/messages'
  end

  get '/users/new' do
    erb :"users/new"
  end
  
  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/messages'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/messages')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/messages'
  end

end