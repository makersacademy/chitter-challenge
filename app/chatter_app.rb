require 'sinatra/base'
require './lib/chat.rb'
require './lib/user.rb'
require './lib/database_connection.rb'

class Chatter < Sinatra::Base
  enable :sessions

  get '/' do
    @chats = Chat.all
    @user = User.find(session[:user_id])
    erb(:index)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/add' do
    Chat.add(params[:text])
    redirect '/'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
