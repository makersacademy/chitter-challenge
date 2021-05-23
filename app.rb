require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './lib/user'
require './lib/database_connection'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = session[:user]
    @peeps = Message.all
    erb(:index)  
  end

  get '/register' do
    erb(:register)
  end

  get '/login' do
    erb(:login)
  end

  post '/' do
    Message.post(params['peep'])
    redirect('/')
  end

  post '/login' do
    session[:user] = User.login(params['email'], params['password'])
    redirect('/')
  end

  post '/logout' do
    session[:user] = User.logout
    redirect('/')
  end

  post '/register' do
    session[:user] = User.create(
      params['first_name'], 
      params['last_name'], 
      params['username'], 
      params['email'], 
      params['password']
    )
    redirect('/')
  end
end
