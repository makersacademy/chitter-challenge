require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    'hello'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/feed' do
    User.create(username: params[:username],password: params[:password])
    session[:user_id] = User.find_by_username(params[:username]).user_id
    redirect '/feed'
  end

  get '/feed' do
    "Welcome, #{User.find_by_user_id(session[:user_id]).username}"
  end

end