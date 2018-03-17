require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/database_connection'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(username: params['username'], email: params['email'], password: params['password'])
    session[:id] = user.id
    redirect '/users/feed'
    p
  end

  get '/users/feed' do
    @user = User.find(session[:id])
    erb :"users/feed"
  end

end
