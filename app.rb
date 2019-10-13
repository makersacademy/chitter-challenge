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
    @posts = Posts.all
    erb :homepage
  end

  get '/posts/new' do
    erb :"posts/new"
  end

  post '/posts' do
    Posts.create(content: params[:content])
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

  run if app_file == $0

end
