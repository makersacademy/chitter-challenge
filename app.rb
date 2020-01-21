require 'sinatra/base'
require './lib/chitter'
require './lib/database_connection_setup'
require './lib/user'



class Chitters < Sinatra::Base
enable :sessions
  get '/' do
    @chitter = Chitter.all
    erb :index
  end

  post '/message' do
    Chitter.create(message: params[:message])
    redirect '/'
  end

  get '/new-user' do
    erb :new_user
  end

  post '/new' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
    @user = User.find(session[:user_id])
    erb :welcome
  end
end
