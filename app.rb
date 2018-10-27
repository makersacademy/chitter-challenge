require 'sinatra/base'
# require 'pg'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    # @registered = session[:registered]
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
    Peep.create(params[:peep], session[:user_id])
    redirect '/'
  end

  get '/user/register' do
    @user = User.find(session[:user_id])
    erb :register
  end

  post '/user/new' do
    user = User.create(params[:firstname], params[:lastname],
        params[:username], params[:password], params[:email])
        # user = nil
        # p user
    if user.instance_of? User
      session[:user_id] = user.id
    else
      flash[:notice] = user
    end
    # session[:registered] = true
    redirect '/'
  end

  post '/user/login' do
    user = User.login(params[:username], params[:password])
    # p user
    if user.nil?
      flash[:notice] = "Incorrect username or password.  Please try again"
    else
      session[:user_id] = user.id
    end
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
