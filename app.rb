require 'sinatra/base'
require 'sinatra/flash'
require './lib/blah'
require './lib/user'
require './database_connection_setup'

class BlahBlah < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/blahs'
  end

  get '/blahs' do
    @user = User.find(session[:user_id])
    @blahs = Blah.all
    erb :'blahs/index'
  end

  post '/blahs' do
    if Blah.create(params[:blah], session[:username])
      redirect '/blahs'
    else
      flash[:notice] = 'You must enter some text!'
    end
  end

  get '/blahs/new' do
    erb :'blahs/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(params)
    session[:user_id], session[:username] = user.id, user.username
    redirect '/blahs'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect '/blahs'
    else
      flash[:notice] = 'The username and password are incorrect.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect('/')
  end

  run! if app_file == $0
end
