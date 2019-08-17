require 'sinatra/base'
require_relative './lib/message'
require_relative './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  get '/' do

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

end