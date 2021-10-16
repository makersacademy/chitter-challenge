require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'

class Chitter < Sinatra::Base
  enable :sessions
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = ???
    @messages = Message.all
    erb :index
  end

  post '/' do
    Message.add(username: params[:username], content: params[:message])
    redirect('/')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.add(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    redirect('/')
  end

  run! if app_file == $0
end