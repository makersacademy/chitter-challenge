require 'sinatra/base'
require './lib/message'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/users/sign_up' do
    erb :"users/sign_up"
  end

  post '/users/sign_up' do
    user = User.sign_up(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect :"messages/new"
  end

  get '/messages' do
    @messages = Message.all
    erb :messages
  end

  get '/messages/new' do
    erb :"messages/new"
  end

  post '/messages/new' do
    Message.create(msg: params['msg'], user_id: session[:user_id])
    redirect :messages
  end

  run! if app_file == $0

end
