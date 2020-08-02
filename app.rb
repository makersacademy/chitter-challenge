require 'sinatra/base'
require 'sinatra/flash'
require_relative 'database_connection_setup'
require './lib/peep'
require './lib/user'
require 'uri'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :"index"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    redirect 'users/new'
  end

  post '/users' do
    user = User.create(
      username: params[:username], 
      email: params[:email], 
      password: params[:password]
      )
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(text: params[:text], user_id: session[:user_id])
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"/sessions/new"
  end

  post '/sessions' do
    redirect '/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = "Please check your email or password"
      p flash[:notice]
      redirect '/sessions/new'
    end
  end

  run! if app_file == $0
end
