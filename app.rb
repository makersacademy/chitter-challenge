require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'
require 'time'
require './database_connection_setup.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect ('/users/new')
  end

  get '/chitter' do
    @user = User.find(session[:user_id])
    @messages = Message.all
    erb(:'/chitter/index')
  end

  get '/chitter/new' do
    erb(:'/chitter/new')
  end

  post '/chitter' do
    @time_stamp = Time.now.strftime("%k:%M %d/%m/%Y")
    Message.create(params[:text], session[:first_name], @time_stamp)
    redirect ('/chitter')
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(params[:first_name], params[:email], params[:password])
    session[:user_id] = user.id
    session[:first_name] = user.first_name
    redirect('/chitter')
  end
  
end