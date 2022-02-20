require 'sinatra/base'
require 'sinatra/flash'
require "sinatra/reloader"
require 'pg'
require 'uri'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  # , :method_override
  
  register Sinatra::Flash

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    @user = User.find(id: session[:user_id])
    peep = Peep.create(peep: params[:peep], user_id: session[:user_id])
    redirect to "/peeps"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users/new' do
    user = User.create(name: params['name'], username: params['username'], 
    email: params['email'], 
    password: params['password'])
    if user == "Unique user error"
      redirect "/users/new/error"
    else
      session[:user_id] = user.id
      redirect "/users"
    end
  end

  get "/users" do
    @users = User.all
    @user = User.find(id: session[:user_id])
    erb :"users/index"
  end

  get "/users/new/error" do
    erb :"users/error"
  end

# As a Maker
# So that only I can post messages on Chitter as me
# I want to log in to Chitter

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps')
  end

  run! if app_file == $0

end
