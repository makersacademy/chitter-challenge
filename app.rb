require 'sinatra/base'
require './lib/message'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  post '/' do
    User.create(name: params[:sign_up_name],
                username: params[:sign_up_username],
                email: params[:sign_up_email],
                password: params[:sign_up_password])
    redirect '/'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages/:username' do
    Message.post(text: params[:message], userid: params[:userid])
    @user = User.find(id: params[:userid])
    @messages = Message.all
    erb :'messages/index'
  end

  get '/messages' do
    @user = nil
    @messages = Message.all
    erb :'messages/index'
  end

  post '/users' do
    @user = User.validate(email: params[:email], password: params[:password])
    @messages = Message.all
    erb :'messages/index'
  end

  post '/messages/user_:username/new' do
    @user = User.find(id: params[:id])
    erb :'messages/new'
  end

end
