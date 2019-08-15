require 'sinatra/base'
require './lib/chat.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions
  get '/' do
    erb :'/root/index'
  end

  get '/messages' do
    p session[:user_id]
    @user = User.find(session[:user_id])
    @messages = Chat.all
    erb :'/messages/index'

  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Chat.create(text: params[:text], created_at: Time.now)
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


  run! if app_file == $0
end

# Time.now.strftime("%d/%m/%Y %H:%M")