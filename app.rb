require 'sinatra'
require './lib/blab.rb'
require './database_connection_setup'

class Blabber < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    @blabs = Blab.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params[:username], params[:name],
      params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/blabs' do
    Blab.create(params[:content])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
