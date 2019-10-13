require 'sinatra/base'
require './lib/chitter'
require 'sinatra/flash'
require './database_connection_setup'

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  before do
    @chitter = Chitter
  end

  get '/' do
    @user = session[:user]
    erb :index
  end

  post '/' do
    @user = session[:user]
    @chitter.create_message(params[:message], @user)
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = @chitter.create_user(params[:email], params[:password], params[:name], params[:user_name])
    if !user
      flash[:notice] = "email or username already in use" unless user
      redirect '/users/new'
    else
      session[:user] = user
      redirect '/'
    end
  end

  get '/users/user' do
    erb :'users/user'
  end

  post '/users/user' do
    user = @chitter.user_log_in(params[:email], params[:password])
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
