require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'
require './lib/user'
require_relative './database_connection_setup'

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
  
  end

  run! if app_file == $0
end