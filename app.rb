require 'sinatra/base'
# require 'pg'
require './lib/peep'
require './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @registered = session[:registered]
    # p session[:user_id]
    @user = User.find(session[:user_id])
    # p @user
    @peeps = Peep.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/peep/new' do
    Peep.create(params[:peep])
    redirect '/'
  end

  get '/user/register' do
    erb :register
  end

  post '/user/new' do
    User.create(params[:firstname], params[:lastname],
        params[:username], params[:password], params[:email])

    # session[:user_id] = user.id
    session[:registered] = true
    redirect '/'
  end

  post '/user/login' do
    user = User.login(params[:username], params[:password])
    # p user
     # p params[:username]
     # p params[:password]
     # p "logged in: #{user}"
    # session[:user_id] = user.id
    session[:registered] = true
    session[:user_id] = user.id
    redirect '/'
  end

  get '/user/logout' do
    # p "sessions clear"
    session.clear
    # flash[:notice] = 'You have signed out.'
    # redirect('/bookmarks')
    redirect '/'
  end

  run! if app_file == $0

end
