require 'sinatra'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative './database_connection_setup'
require_relative './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  register Sinatra::Flash

  get '/' do
    @peep = Peep.all
    erb :index
  end

  get '/peeping' do
    erb :peeping
  end

  post '/peeping' do
    user = User.find(id: session[:user_id])
    if user
      Peep.peep(peep: params[:peep], user: user.email)
    else
      Peep.peep(peep: params[:peep], user: 'Anon')
    end
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/welcome'
    else
      flash[:notice] = 'Please correct your email or password!'
      redirect '/login'
    end
  end

  get '/login/new' do
    erb :'login/new'
  end

  post '/login/new' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/welcome/new'
  end

  get '/welcome' do
    @user = User.find(id: session[:user_id])
    erb :welcome
  end

  get '/welcome/new' do
    @user = User.find(id: session[:user_id])
    erb :'welcome/new'
  end

  post '/logout' do
    session.clear
    flash[:notice] = "You're now signed out!"
    redirect '/'
  end

  run if app_file == $0
end
