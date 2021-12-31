require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'homepage'
  end

  get '/peeps' do
    # Fetch the user from the database, using an ID stored in the session
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users/new'
  end
  
  # post '/users/new' do >> also changed views
  post '/users' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/users/login'
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
    user = { email: 'hagrid@mail.com', password: 'hagrid123' }
    # User.login(email: params[:email], password: params[:password])
    #   # session[:username] = User.find(username: @user.username)
    #   # session[:email] = @user.email
    #   # session[:id] = User.find(id: @user.id)
    # # session[:user_id] = user.id
    # session[:username] = user.username
    redirect '/peeps'
  end


  run! if app_file == $0
end
