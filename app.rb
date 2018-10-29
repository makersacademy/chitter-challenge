require 'sinatra/base'
require './lib/message'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Chitter'
  end

  get '/messages' do
    # Fetch the user from the database, using an ID stored in the session
    @user = User.find(session[:user_id])
    @messages = Message.all
    erb :'messages/index'
  end

  post '/messages' do
    @user = User.find(session[:user_id])
    Message.create(message: params['message'], name: @user.name)
    redirect '/messages'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/messages'
  end

  run if app_file == $0
end
