require 'sinatra/base'
require 'sinatra/flash'
require 'pg'
require_relative './lib/posts'
require_relative './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_overide
  register Sinatra::Flash

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    @user = Users.find(session[:user_id])
    # @user_name = Users.username(session[:user_id])
    @user_id = session[:user_id]
    @posts = Posts.all
    p "#{@posts}"
    erb :homepage
  end

  get '/user/:id/posts/new' do
    @user_id = params[:id]
    erb :"posts/new"
  end

  post '/user/:id/posts' do
    Posts.create(content: params[:content], user_id: params[:id])
    redirect '/homepage'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = Users.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/homepage'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = Users.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/homepage'
    else
      flash[:notice] = 'Invalid email, please try again'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'User signed out'
    redirect '/homepage'
  end

  run if app_file == $0

end
