require 'sinatra'
require 'sinatra/flash'
require './lib/blab.rb'
require './lib/user.rb'
require './database_connection_setup'

class Blabber < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:user_id])
    @blabs = Blab.all
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/blabs' do
    Blab.create(params[:content], session[:user_id])
    redirect '/'
  end

  post '/users' do
    user = User.create(params[:username], params[:name],
      params[:email], params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'invalid email or password'
      redirect('/sessions/new')
    end
  end

  post '/sessions/delete' do
    session.clear
    flash[:notice] = 'you are now logged out'
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
