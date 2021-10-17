require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/message.rb'
require './lib/user.rb'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(session[:user_id])
    @messages = Message.all
    erb :index
  end

  post '/' do
    Message.create(username: params[:username], content: params[:message])
    redirect('/')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your username or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end