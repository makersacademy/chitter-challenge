require 'sinatra'
require 'sinatra/reloader'
require './lib/message'
require 'pg'
require_relative 'database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    'Hello World'
  end

  get '/messages' do
    @user = User.find(session[:user_id])
    @messages = Message.all
    erb :'messages/index'
  end

  post '/messages/post' do
    Message.post(params[:content])
    redirect '/messages'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/messages'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    User.authenticate(params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/messages'
  end

  run! if app_file == $0

end