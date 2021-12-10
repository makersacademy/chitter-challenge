require 'sinatra/base'
require 'sinatra/reloader'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @user = User.find(session[:id])
    erb :index
  end

  get '/users/new' do
    erb :signup
  end

  post '/users' do
    user = User.create(params[:name], params[:username], params[:email], params[:password])
    session[:id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
