require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions, :method_override

  get '/' do
    erb :welcome
  end

  post '/sign_up' do
    redirect '/users/new'
  end

  post '/sign_in' do
    redirect '/sessions/new'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peep' do
    redirect '/peeps/new'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    Peep.post(peep: params[:peep], user_id: session[:user_id])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users' do
    user = User.create(
      email: params['email'], 
      password: params['password'], 
      name: params['name'], 
      username: params['username']
    )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Incorrect email or password! Please check your details.'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'See you soon!!'
    redirect '/'
  end

  run! if app_file == $0
end
