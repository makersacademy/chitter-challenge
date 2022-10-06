require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require_relative './lib/message'
require_relative './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter!'
  end

  get '/messages' do
    #@user = User.find(session[:user_id])
    @messages = Message.all
    erb :"messages/index"
  end

  get '/messages/post' do
    erb :"messages/post"
  end

  post '/messages' do
    Message.create(message: params[:message])
    redirect('/messages')
  end

  delete '/messages/:id' do
    Message.delete(id: params[:id])
    redirect '/messages'
  end

  get '/messages/:id/edit' do
    @message = Message.find(id: params[:id])
    erb :"messages/edit"
  end

  patch '/messages/:id' do
    Message.update(id: params[:id], message: params[:message])
    redirect ('/messages')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/messages'
  end

  run! if app_file == $0
end