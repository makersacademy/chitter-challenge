require "sinatra"
require "sinatra/base"
require 'sinatra/flash'
require "sinatra/reloader" if development?
require './database_connection_setup'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @peeps = Peep.all
    @user = User.find(id: session[:user_id])
    erb :index
  end
  
  post '/add_peep' do
    Peep.add(params[:peep], params[:user])
    redirect '/'
  end 

  get '/user/signup' do
    erb :'user/signup'
  end

  get '/user/signin' do
    erb :'user/signin'
  end

  get '/user/signout' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/user/signin' do
    user = User.authenticate(params[:email], params[:password])
    unless user.nil?
      session[:user_id] = user.user_id
      redirect '/'
    else
      # flash[:notice] = 'Incorrect email or password, please try again.'
      redirect '/user/signin'
    end
  end

  post '/user/signup' do
    user = User.authenticate(params[:email], params[:password]) 
    unless user.nil?
      redirect '/user/signin'
    else
      user = User.add(params[:name], params[:username], params[:email], params[:password])
      session[:user_id] = user.user_id
      redirect '/'
    end
  end

  run! if app_file == $0
end
