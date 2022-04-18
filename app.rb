require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/message'
require_relative './database_connection_setup'
require_relative './lib/user'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  enable :method_overide, :sessions

  get '/' do
    @user = User.find(id: session[:user_id])
    @messages = Message.all
    erb :index
  end

  post '/' do
    Message.create(message: params[:comment])
    redirect '/'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'Please check your email or password'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect '/'
  end

  run! if app_file == $0
end
