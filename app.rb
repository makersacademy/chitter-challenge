require 'sinatra/base'
require 'data_mapper'
require './lib/models'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.get(session[:user_id])
    @messages = Message.all(:order => [:id.desc])
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(
      name: params['name'],
      username: params['username'],
      email: params['email'],
      password: params['password']
    )
    session[:user_id] = user.id
    redirect '/'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Message.create(text: params['post'], user_id: session[:user_id])
    p params
    session[:user_id]
    redirect '/'
  end

  run! if app_file == $0
end
