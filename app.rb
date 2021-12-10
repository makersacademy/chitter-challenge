require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/messages' do
    @user = User.find(session[:user_id])
    @messages = Message.all
    erb :messages
  end

  get '/messages-by-oldest' do
    @user = User.find(session[:user_id])
    @messages = Message.all.reverse
    erb :messages_by_oldest
  end

  post '/messages' do
    Message.create(text: params[:text])
    redirect '/messages'
  end

  post '/users' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/messages'
  end

  run! if app_file == $0
end