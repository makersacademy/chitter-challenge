require 'sinatra/base'
require './lib/messages'
require 'sinatra/flash'
require './lib/users'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  before do
    @messages = Messages
  end

  get '/' do
    flash[:notice]
    @user = session[:user]
    @messages.instance
    erb :index
  end

  post '/' do
    @user = session[:user]
    @messages.create(params[:message], @user)
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = Users.create(params[:email], params[:password], params[:name], params[:user_name])
    flash[:notice] = "email or username already in use" unless user
    session[:user] = user
    redirect '/'
  end

  get '/users/user' do
    erb :'users/user'
  end

  post '/users/user' do
    user = Users.find(params[:email], params[:password])
    if !user
      flash[:notice] = "email or username incorrect" unless user
      redirect '/users/user'
    else
      session[:user] = user
      redirect '/'
    end
  end

  run! if app_file == $0
end
