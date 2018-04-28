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
    erb :'blahs/index', :layout => :'layout/main'
  end

  post '/blahs' do
    if Blah.create(params[:blah], session[:username])
      flash.next[:success] = 'Blah successful!'
    else
      flash.next[:error] = 'Blah cannot be empty!'
    end
    redirect '/blahs'
  end

  get '/blahs/new' do
    erb :'blahs/new'
  end

  get '/users/new' do
    erb :'users/new', :layout => :'layout/main'
  end

  post '/users' do
    user = User.create(params)
    session[:user_id], session[:username] = user.id, user.username
    redirect '/blahs'
  end

  get '/sessions/new' do
    erb :'sessions/new', :layout => :'layout/main'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id], session[:username] = user.id, user.username
      redirect '/blahs'
    else
      flash.next[:error] = 'The username or password is incorrect. Please try again.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash.next[:success] = 'You have signed out'
    redirect('/')
  end

  run! if app_file == $0
end
