require 'sinatra/base'
require './lib/message'
require './lib/user'


class ChitterChatter < Sinatra::Base
  enable :sessions

  get '/messages' do
    @user = User.find(id: session[:user_id])
    @messages = Message.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Message.add(title: params[:message_title], body: params[:message_body])
    redirect '/messages'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'], name: params['name'])
    session[:user_id] = user.id
    redirect '/messages'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end
  post '/sessions' do
    user = User.create(email: params['email'], password: params['password'], name: params['name'])
    session[:user_id] = user.id
    redirect('/messages')
  end

  run! if app_file == $0
end