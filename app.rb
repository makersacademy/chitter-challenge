require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'
require './lib/user'
require_relative './database_connection_setup'
require 'bcrypt'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  get '/' do
    erb :index
  end

  get '/chitters' do
    @user = User.find(session[:user_id])
    @peeps = Chitter.all
    erb :"chitters/index"
  end

  post '/chitters' do
    Chitter.create(params[:peep])
    redirect '/chitters'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/chitters'
  end

  post '/sign_in' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/chitters'
    else
      flash[:notice] = 'Please check your email or password'
      redirect '/sessions/new'
    end
   
  end

  run! if app_file == $0
end