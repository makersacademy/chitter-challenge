require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Welcome to Chitter'
  end

  get '/users/new' do
    erb :"users/new"
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

  run! if app_file == $0
end
