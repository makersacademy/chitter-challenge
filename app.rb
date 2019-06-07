require 'sinatra/base'
require './models/user'

class Chitter < Sinatra::Base
  enable :sessions
  #Homepage
  get '/' do
    erb :index
  end

  #Create new user
  get '/users/new' do
    erb :"users/new"
  end

  #Save user to database
  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/chitter/feed'
  end

  get '/chitter' do
    erb :submit_peep
  end 

  #Display all peeps
  post '/chitter/feed' do
    session[:peep] = params[:Peep]
    redirect '/chitter/feed'
  end

  get '/chitter/feed' do
    @peep = session[:peep]
    erb :feed
  end

  get '/log_in' do
    erb :login
  end
end