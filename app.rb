require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require 'uri'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(session[:user_id])
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

  get '/peep/:id/reply' do
    @peep = Peep.find(params[:id])
    erb :reply
  end

  post '/peep/:id/reply/new' do
    Peep.create(params[:peep], session[:user_id], params[:parent_peep])
    redirect '/'
  end

  get '/user/register' do
    @user = User.find(session[:user_id])
    erb :register
  end

  post '/user/new' do
    user = User.create(params[:firstname], params[:lastname],
        params[:username], params[:password], params[:email])
    if user.instance_of? User
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = user
      redirect back
    end
  end

  post '/user/login' do
    user = User.login(params[:username], params[:password])
    if user.nil?
      flash[:notice] = "Incorrect username or password.  Please try again"
    else
      session[:user_id] = user.id
    end
    redirect '/'
  end

  get '/user/logout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0

end
