require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'
require './lib/user.rb'
require './database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

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
    session[:user_id] = user
    redirect('/')
  end

  run! if app_file == $0
end