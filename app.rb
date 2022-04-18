require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'
require './lib/user'
require_relative './database_connection_setup'
require 'bcrypt'
require 'sinatra/flash'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end
  enable :sessions


  get '/' do
    erb :index
  end

  get '/chitters' do
    @user = User.find(id: session[:user_id])
    @peeps = Chitter.all
    erb :"chitters/index"
  end

  post '/chitters' do
    Chitter.create(params[:peep], session[:user_id])
    redirect '/chitters'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/chitters'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sign_in' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/chitters'
    else
      flash[:notice] = "Please check your email or password"
      redirect '/sessions/new'
  end
end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out."
    redirect '/chitters'
  end

  run! if app_file == $0
end